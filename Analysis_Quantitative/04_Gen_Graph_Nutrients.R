# ============================================================================
# SCRIPT 4: HEATMAP DE ADECUACIÓN NUTRICIONAL POR GRUPO ETARIO
# ============================================================================
# Descripción: Genera heatmap visualizando el % de adecuación RIEN para
#              todos los nutrientes por grupo etario
# 
# Input:  - DS_Talleres_RIEN.rds
# Output: - panel_b_heatmap.pdf (usado en el artículo)
#
# Autores: Arcila-Agudelo, A.M., Cardona-Trujillo, H., et al.
# Fecha: 2024-2026
# ============================================================================

# Cargar librerías
library(tidyverse)
library(ggplot2)
library(reshape2)

# Limpiar entorno
rm(list = ls())

cat("\n=== GENERANDO HEATMAP NUTRICIONAL ===\n\n")

# ============================================================================
# 1. CARGAR Y PREPARAR DATOS
# ============================================================================

cat("Paso 1: Cargando datos RIEN...\n")
ds_RIEN <- read_rds("DS_Talleres_RIEN.rds")

cat("✓ Datos cargados\n")
cat("  - Participantes:", length(unique(ds_RIEN$ID)), "\n")
cat("  - Grupos etarios:", length(unique(ds_RIEN$Grupo)), "\n\n")

# ============================================================================
# 2. CALCULAR % DE ADECUACIÓN RIEN
# ============================================================================

cat("Paso 2: Calculando % de adecuación RIEN...\n")

# Calcular porcentaje de adecuación usando el promedio de EAR y RDA
ds_adequacy <- ds_RIEN %>%
  mutate(
    # % Adecuación respecto a valores de referencia
    Pct_Calorias = (Calorias / Calorias_ref) * 100,
    Pct_Proteina = (Proteina / ((Proteina_EAR + Proteina_RDA) / 2)) * 100,
    Pct_CHO = (CHO / ((CHO_EAR + CHO_RDA) / 2)) * 100,
    Pct_Grasas = (Grasas / ((Grasas_AI_min + Grasas_AI_max) / 2)) * 100,
    Pct_Fibra = (Fibra / Fribra_AI) * 100,
    Pct_Calcio = (Calcio / ((Calcio_EAR + Calcio_RDA) / 2)) * 100,
    Pct_Hierro = (Hierro / ((Hierro_EAR + Hierro_RDA) / 2)) * 100,
    Pct_Sodio = (Sodio / Sodio_AI) * 100
  ) %>%
  # Promediar por grupo etario
  group_by(Grupo) %>%
  summarise(
    Carbohydrates = mean(Pct_CHO, na.rm = TRUE),
    Proteins = mean(Pct_Proteina, na.rm = TRUE),
    Fats = mean(Pct_Grasas, na.rm = TRUE),
    Fiber = mean(Pct_Fibra, na.rm = TRUE),
    Calcium = mean(Pct_Calcio, na.rm = TRUE),
    Iron = mean(Pct_Hierro, na.rm = TRUE),
    Sodium = mean(Pct_Sodio, na.rm = TRUE)
  )

# Renombrar grupos etarios para visualización
ds_adequacy <- ds_adequacy %>%
  mutate(
    Age_Group = case_when(
      str_detect(Grupo, "19 a 30") ~ "Youth (18-30)",
      str_detect(Grupo, "31 a 50") ~ "Adults (31-50)",
      str_detect(Grupo, "51 a 70|\\+50") ~ "Older (51+)",
      TRUE ~ Grupo
    )
  ) %>%
  select(-Grupo)

cat("✓ Adecuación calculada\n\n")

# ============================================================================
# 3. PREPARAR DATOS PARA HEATMAP
# ============================================================================

cat("Paso 3: Preparando datos para visualización...\n")

# Transformar a formato largo para ggplot
df_melt <- melt(ds_adequacy, 
                id.vars = "Age_Group", 
                variable.name = "Nutrient", 
                value.name = "Adequacy")

# Ordenar grupos etarios
df_melt$Age_Group <- factor(df_melt$Age_Group, 
                           levels = c("Youth (18-30)", 
                                     "Adults (31-50)", 
                                     "Older (51+)"))

cat("✓ Datos preparados para heatmap\n\n")

# ============================================================================
# 4. GENERAR HEATMAP
# ============================================================================

cat("Paso 4: Generando heatmap...\n")

# Crear heatmap con escala de colores divergente
# Rojo = inadecuación (< 70% o > 130%)
# Amarillo = subóptimo (70-90% o 110-130%)
# Verde = adecuado (90-110%)

p_heatmap <- ggplot(df_melt, aes(x = Nutrient, y = Age_Group, fill = Adequacy)) +
  geom_tile(color = "white", size = 0.5) +
  scale_fill_gradientn(
    colors = c("#d73027", "#fc8d59", "#fee08b", "#d9ef8b", "#91cf60", "#1a9850",
               "#d9ef8b", "#fee08b", "#fc8d59", "#d73027"),
    values = scales::rescale(c(0, 50, 70, 90, 100, 110, 130, 150)),
    limits = c(0, 150),
    name = "% RIEN\nAdequacy",
    breaks = c(50, 70, 90, 110, 130),
    labels = c("50%", "70%", "90%", "110%", "130%")
  ) +
  geom_text(aes(label = round(Adequacy)), size = 3.5, fontface = "bold") +
  labs(
    title = "Nutritional Adequacy by Age Group",
    subtitle = "% of Recommended Intake (RIEN) achieved by co-designed ideal menus",
    x = "",
    y = ""
  ) +
  theme_minimal(base_size = 12) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, face = "bold"),
    axis.text.y = element_text(face = "bold"),
    plot.title = element_text(size = 14, face = "bold"),
    plot.subtitle = element_text(size = 10, color = "gray30"),
    legend.position = "right",
    panel.grid = element_blank()
  )

# Guardar en PDF (alta calidad para artículo)
pdf("panel_b_heatmap.pdf", width = 8, height = 3.5)
print(p_heatmap)
dev.off()

# También guardar en PNG
png("graphs/panel_b_heatmap.png", width = 2400, height = 1050, res = 300)
print(p_heatmap)
dev.off()

cat("✓ Heatmap guardado:\n")
cat("  - panel_b_heatmap.pdf (para artículo)\n")
cat("  - graphs/panel_b_heatmap.png (para presentaciones)\n\n")

# ============================================================================
# 5. RESUMEN ESTADÍSTICO
# ============================================================================

cat("=== RESUMEN DE ADECUACIÓN NUTRICIONAL ===\n\n")

# Mostrar tabla de valores
cat("% Adecuación RIEN por grupo etario:\n")
print(ds_adequacy %>% mutate(across(where(is.numeric), ~round(.x, 1))))

cat("\n")

# Identificar nutrientes con mayor inadecuación
cat("Nutrientes con MENOR adecuación (<80%):\n")
df_melt %>%
  filter(Adequacy < 80) %>%
  arrange(Adequacy) %>%
  mutate(Adequacy = round(Adequacy, 1)) %>%
  print()

cat("\nNutrientes con posible EXCESO (>120%):\n")
df_melt %>%
  filter(Adequacy > 120) %>%
  arrange(desc(Adequacy)) %>%
  mutate(Adequacy = round(Adequacy, 1)) %>%
  print()

cat("\n============================================\n")
cat("✓ HEATMAP NUTRICIONAL GENERADO EXITOSAMENTE\n")
cat("============================================\n")
cat("Este gráfico muestra que los menús ideales:\n")
cat("  → Alcanzan mayor adecuación en grasas y sodio\n")
cat("  → Presentan menor adecuación en calcio y hierro\n")
cat("  → Reflejan patrones de sub-representación de\n")
cat("    lácteos y verduras (fuentes de Ca y Fe)\n\n")