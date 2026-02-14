# ============================================================================
# SCRIPT 1: GENERACIÓN DE DATASETS PARA ANÁLISIS GABAS Y RIEN
# ============================================================================
# Descripción: Procesa datos crudos de talleres participativos y genera
#              datasets estructurados para comparación con referencias
#              nutricionales colombianas (GABAS y RIEN)
# 
# Input:  - Bases de datos.xlsx (datos crudos de talleres)
# Output: - DS_Talleres_GABAS.rds/.xlsx (porciones por grupo alimentario)
#         - DS_Talleres_RIEN.rds/.xlsx (adecuación nutricional)
#
# Autores: Arcila-Agudelo, A.M., Cardona-Trujillo, H., et al.
# Fecha: 2024-2026
# ============================================================================

# Cargar librerías necesarias
library(tidyverse)
library(readxl)
library(writexl)

# ============================================================================
# 1. CARGAR Y PREPARAR DATOS DE TALLERES
# ============================================================================

cat("\n=== PASO 1: Cargando datos de talleres ===\n")

# Leer datos de gramaje de alimentos seleccionados en talleres
ds <- readxl::read_xlsx("Bases de datos.xlsx", sheet = "Gramaje")

# Leer tabla de equivalencias para grupos GABA
eqv_gabas <- readxl::read_xlsx("Bases de datos.xlsx", 
                               sheet = "equiv_table_GABAS")

# Seleccionar y renombrar columnas relevantes
ds <- ds %>% 
  dplyr::select(
    ID, Region, Grupo, Plato, 
    `Grupo alimentario`, Alimento, `Porción final`,
    `Calorias porción elegida`, 
    `Proteina porción elegida`,
    `Carbohidratos por porción elegida`,
    `Grasas por porción elegida`,
    `Fibra por porción elegida`,
    `Calcio por porción elegida`,
    `Hierro por porción elegida`,
    `Sodio por porción elegida`
  )

# Renombrar para trabajar más fácilmente
names(ds) <- c(
  "ID", "Region", "Grupo", "Plato", "G_Alimento", "Alimento", "Porcion",
  "Calorias", "Proteina", "CHO", "Grasas", "Fibra", "Calcio",
  "Hierro", "Sodio"
)

# Unir con tabla de equivalencias GABA
ds <- merge(ds, eqv_gabas)
ds <- ds %>% 
  select(ID, Region, Grupo, G_Alimento, G_Alimento_GABA, 
         Plato, Alimento:Sodio)

# Estandarizar nombre de región
ds <- ds %>% 
  mutate(Region = ifelse(Region == "Medellín", "Medellin", Region))

cat("✓ Datos de talleres preparados\n")
cat("  - Registros:", nrow(ds), "\n")
cat("  - Regiones:", unique(ds$Region), "\n")
cat("  - Grupos etarios:", unique(ds$Grupo), "\n\n")

# ============================================================================
# 2. ANÁLISIS GABAS (Guías Alimentarias Basadas en Alimentos)
# ============================================================================

cat("=== PASO 2: Procesando datos GABAS ===\n")

# Calcular porciones totales por región, grupo alimentario GABA y grupo etario
ds_GABAS <- ds %>% 
  group_by(Region, G_Alimento_GABA, Grupo) %>% 
  summarise(Porcion = sum(Porcion, na.rm = TRUE), .groups = "drop")

# Calcular mediana de porciones por región y grupo alimentario
ds_GABAS <- ds_GABAS %>% 
  group_by(Region, G_Alimento_GABA) %>% 
  summarise(Porcion = median(Porcion, na.rm = TRUE), .groups = "drop")

# Cargar referencias GABAS (porciones recomendadas)
GABAS_ref <- readxl::read_xlsx("Bases de datos.xlsx", 
                               sheet = "GABAS_Referencias")
GABAS_ref <- GABAS_ref[, c(1, 5)]
names(GABAS_ref) <- c("G_Alimento_GABA", "porcion_ref")

# Unir con referencias para comparación
GABAS_ds <- merge(ds_GABAS, GABAS_ref)

cat("✓ Dataset GABAS generado\n")
cat("  - Grupos alimentarios:", length(unique(GABAS_ds$G_Alimento_GABA)), "\n")
cat("  - Comparación con porciones recomendadas incluida\n\n")

# ============================================================================
# 3. ANÁLISIS RIEN (Recomendaciones de Ingesta de Energía y Nutrientes)
# ============================================================================

cat("=== PASO 3: Procesando datos RIEN ===\n")

# Cargar referencias RIEN
# Energía: Promedio actividad ligera-moderada × 70kg (adulto sano)
# Proteína: g/kg/día × 70 (EAR y RDA)
# Carbohidratos: g/día (EAR y RDA)
# Grasas: g/día (EAR y RDA)
# Fibra: g/día (promedio hombre-mujer)
# Calcio, Hierro, Sodio: mg/día (AI)

rien_ref <- readxl::read_xlsx("Bases de datos.xlsx", 
                              sheet = "RIEN", range = "A1:N4")

# Calcular totales nutricionales por participante y grupo
ds_RIEN <- ds %>% 
  group_by(ID, Region, Grupo) %>% 
  summarise(across(Calorias:Sodio, ~ sum(.x, na.rm = TRUE)), 
            .groups = "drop") %>% 
  mutate(Grupo = recode(Grupo,
                        "19 - 30" = "19 a 30 años",
                        "31 - 50" = "31 a 50 años",
                        "+50" = "51 a 70 años"))

# Unir con referencias RIEN para comparación
RIEN_ds <- merge(ds_RIEN, rien_ref)

cat("✓ Dataset RIEN generado\n")
cat("  - Participantes:", length(unique(RIEN_ds$ID)), "\n")
cat("  - Nutrientes analizados: 7 (energía, macro y micronutrientes)\n")
cat("  - Comparación con referencias RIEN incluida\n\n")

# ============================================================================
# 4. GUARDAR DATASETS PROCESADOS
# ============================================================================

cat("=== PASO 4: Guardando datasets ===\n")

# Guardar en formato RDS (nativo de R)
write_rds(RIEN_ds, "DS_Talleres_RIEN.rds")
write_rds(GABAS_ds, "DS_Talleres_GABAS.rds")

# Guardar en formato Excel (para compartir)
writexl::write_xlsx(RIEN_ds, "DS_Talleres_RIEN.xlsx")
writexl::write_xlsx(GABAS_ds, "DS_Talleres_GABAS.xlsx")

cat("✓ Datasets guardados:\n")
cat("  - DS_Talleres_RIEN.rds / .xlsx\n")
cat("  - DS_Talleres_GABAS.rds / .xlsx\n\n")

cat("============================================\n")
cat("✓ PROCESO COMPLETADO EXITOSAMENTE\n")
cat("============================================\n")
cat("Los datasets están listos para visualización\n")
cat("Siguiente paso: ejecutar scripts 02, 03 y 04\n\n")

