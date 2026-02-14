# ============================================================================
# SCRIPT 3: VISUALIZACIÓN DE ANÁLISIS GABAS
# ============================================================================
# Descripción: Genera gráficos comparando las porciones de grupos alimentarios
#              seleccionadas en los talleres vs recomendaciones GABAS
# 
# Input:  - DS_Talleres_GABAS.rds
# Output: - Gráficos de porciones por grupo alimentario (carpeta graphs/)
#
# Autores: Arcila-Agudelo, A.M., Cardona-Trujillo, H., et al.
# Fecha: 2024-2026
# ============================================================================

# Cargar librerías
library(tidyverse)
library(hrbrthemes)

# Limpiar entorno
rm(list = ls())

cat("\n=== GENERANDO GRÁFICOS GABAS ===\n\n")

# ============================================================================
# 1. CARGAR DATOS PROCESADOS
# ============================================================================

cat("Paso 1: Cargando datos GABAS...\n")
ds_GABAS <- read_rds("DS_Talleres_GABAS.rds")

# Crear variable combinada para visualización
ds_GABAS$x <- paste0(ds_GABAS$Region, " - ", ds_GABAS$G_Alimento_GABA)

cat("✓ Datos cargados\n")
cat("  - Regiones:", length(unique(ds_GABAS$Region)), "\n")
cat("  - Grupos alimentarios:", length(unique(ds_GABAS$G_Alimento_GABA)), "\n\n")

# ============================================================================
# 2. FUNCIÓN PARA GENERAR GRÁFICOS
# ============================================================================

# Función para crear gráficos de porciones vs referencias
get_graph_gabas <- function(ds, titulo = "Porciones GABAS") {
  
  ggplot(ds, aes(x = x, y = Porcion)) +
    geom_point(aes(y = porcion_ref), 
               color = rgb(0.2, 0.7, 0.1, 0.7), 
               size = 4, shape = 18) +
    geom_segment(aes(x = x, xend = x, y = Porcion, yend = porcion_ref), 
                 color = "grey", linewidth = 1) +
    geom_point(color = rgb(0.7, 0.2, 0.1, 0.7), size = 3) +
    coord_flip() +
    theme_ipsum() +
    theme(
      legend.position = "none",
      axis.text.y = element_text(size = 10)
    ) +
    labs(
      x = "",
      y = "Porciones diarias",
      title = titulo,
      subtitle = "Rombo verde = Recomendación GABAS | Punto rojo = Porción diseñada"
    )
}

# ============================================================================
# 3. GENERAR GRÁFICOS POR REGIÓN
# ============================================================================

cat("Paso 2: Generando gráficos por región...\n")

# Crear carpeta para gráficos si no existe
if (!dir.exists("graphs")) {
  dir.create("graphs")
}

# Grafico general con todas las regiones
p_all <- get_graph_gabas(ds_GABAS, "Comparación GABAS - Todas las regiones")
ggsave("graphs/reg_GABAS.png", p_all, width = 12, height = 8, dpi = 300)
cat("✓ Guardado: graphs/reg_GABAS.png\n")

# ============================================================================
# 4. ANÁLISIS AGREGADO
# ============================================================================

cat("\nPaso 3: Generando análisis agregado...\n")

# Calcular promedios por grupo alimentario
ds_GABAS_agg <- ds_GABAS %>%
  group_by(G_Alimento_GABA) %>%
  summarise(
    Porcion_media = mean(Porcion, na.rm = TRUE),
    Porcion_ref = first(porcion_ref)
  )

# Gráfico agregado
p_agg <- ggplot(ds_GABAS_agg, 
                aes(x = reorder(G_Alimento_GABA, Porcion_media), 
                    y = Porcion_media)) +
  geom_col(fill = rgb(0.7, 0.2, 0.1, 0.7)) +
  geom_point(aes(y = Porcion_ref), 
             color = rgb(0.2, 0.7, 0.1, 0.9), 
             size = 5, shape = 18) +
  geom_hline(yintercept = 0, color = "gray30") +
  coord_flip() +
  theme_ipsum() +
  labs(
    x = "",
    y = "Porciones diarias promedio",
    title = "Resumen GABAS - Promedio todas las regiones",
    subtitle = "Barras rojas = Porciones diseñadas | Rombo verde = Recomendación GABAS"
  )

ggsave("graphs/ALL_GABAS.png", p_agg, width = 10, height = 7, dpi = 300)
cat("✓ Guardado: graphs/ALL_GABAS.png\n")

# ============================================================================
# 5. RESUMEN Y ESTADÍSTICAS
# ============================================================================

cat("\n=== RESUMEN COMPARATIVO ===\n")

summary_gabas <- ds_GABAS %>%
  mutate(
    dif_absoluta = Porcion - porcion_ref,
    dif_porcentual = ((Porcion - porcion_ref) / porcion_ref) * 100
  )

# Mostrar grupos con mayor divergencia
cat("\nGrupos alimentarios con MAYOR diferencia (% vs recomendación):\n")
summary_gabas %>%
  group_by(G_Alimento_GABA) %>%
  summarise(dif_pct_promedio = mean(dif_porcentual, na.rm = TRUE)) %>%
  arrange(desc(abs(dif_pct_promedio))) %>%
  head(5) %>%
  mutate(dif_pct_promedio = round(dif_pct_promedio, 1)) %>%
  print()

cat("\n============================================\n")
cat("✓ GRÁFICOS GABAS GENERADOS EXITOSAMENTE\n")
cat("============================================\n")
cat("Archivos creados en carpeta: graphs/\n")
cat("  - reg_GABAS.png (por región)\n")
cat("  - ALL_GABAS.png (agregado)\n\n") 
