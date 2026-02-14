# ============================================================================
# SETUP.R - Configuración Rápida del Entorno de Análisis
# ============================================================================
# Descripción: Script para verificar y configurar el entorno R necesario
#              para reproducir los análisis cuantitativos
# Uso: source("setup.R") desde la raíz del proyecto
# ============================================================================

cat("\n")
cat("============================================\n")
cat("  CONFIGURACIÓN DEL ENTORNO DE ANÁLISIS    \n")
cat("  Food Perception Rural Colombia Study     \n")
cat("============================================\n\n")

# ============================================================================
# 1. VERIFICAR VERSIÓN DE R
# ============================================================================

cat("PASO 1: Verificando versión de R...\n")
r_version <- getRversion()
cat("  Versión actual:", as.character(r_version), "\n")

if (r_version < "4.0.0") {
  warning("⚠️  Se recomienda R versión 4.0 o superior")
  cat("    Por favor actualice R desde: https://www.r-project.org/\n\n")
} else {
  cat("  ✓ Versión de R adecuada\n\n")
}

# ============================================================================
# 2. INSTALAR PAQUETES REQUERIDOS
# ============================================================================

cat("PASO 2: Verificando paquetes requeridos...\n")

# Lista de paquetes necesarios
required_packages <- c(
  "tidyverse",      # Manipulación de datos y gráficos
  "hrbrthemes",     # Temas para ggplot2
  "readxl",         # Lectura de archivos Excel
  "writexl",        # Escritura de archivos Excel
  "reshape2",       # Reformateo de datos
  "ggplot2"         # Visualización de datos
)

# Verificar qué paquetes faltan
missing_packages <- required_packages[!(required_packages %in% 
                                         installed.packages()[,"Package"])]

if (length(missing_packages) > 0) {
  cat("\n  Instalando paquetes faltantes:\n")
  cat("  ", paste(missing_packages, collapse = ", "), "\n\n")
  
  install.packages(missing_packages, dependencies = TRUE)
  
  cat("  ✓ Paquetes instalados exitosamente\n\n")
} else {
  cat("  ✓ Todos los paquetes ya están instalados\n\n")
}

# ============================================================================
# 3. CARGAR PAQUETES
# ============================================================================

cat("PASO 3: Cargando paquetes...\n")

suppressPackageStartupMessages({
  library(tidyverse)
  library(hrbrthemes)
  library(readxl)
  library(writexl)
  library(reshape2)
  library(ggplot2)
})

cat("  ✓ Todos los paquetes cargados correctamente\n\n")

# ============================================================================
# 4. VERIFICAR ESTRUCTURA DEL PROYECTO
# ============================================================================

cat("PASO 4: Verificando estructura del proyecto...\n")

# Directorios esperados
expected_dirs <- c(
  "Analysis_Quantitative",
  "Analysis_Qualitative",
  "Participatory_Workshop_Forms",
  "Participatory_Workshop_Evidence-Transcriptions",
  "Participatory_Workshops_Design"
)

# Archivos clave
key_files <- c(
  "Analysis_Quantitative/01_GenDataSet.R",
  "Analysis_Quantitative/02_Gen_Graph_RIEN.R",
  "Analysis_Quantitative/03_Gen_Graph_GABAS.R",
  "Analysis_Quantitative/04_Gen_Graph_Nutrients.R",
  "Analysis_Quantitative/Bases de datos.xlsx"
)

# Verificar directorios
missing_dirs <- expected_dirs[!dir.exists(expected_dirs)]
if (length(missing_dirs) > 0) {
  warning("⚠️  Directorios faltantes: ", paste(missing_dirs, collapse = ", "))
} else {
  cat("  ✓ Estructura de directorios correcta\n")
}

# Verificar archivos clave
missing_files <- key_files[!file.exists(key_files)]
if (length(missing_files) > 0) {
  warning("⚠️  Archivos faltantes: ", paste(missing_files, collapse = ", "))
} else {
  cat("  ✓ Archivos clave presentes\n")
}

cat("\n")

# ============================================================================
# 5. CREAR CARPETA DE GRÁFICOS (SI NO EXISTE)
# ============================================================================

graphs_dir <- "Analysis_Quantitative/graphs"
if (!dir.exists(graphs_dir)) {
  dir.create(graphs_dir, recursive = TRUE)
  cat("  ✓ Carpeta 'graphs' creada\n\n")
} else {
  cat("  ✓ Carpeta 'graphs' existe\n\n")
}

# ============================================================================
# 6. INFORMACIÓN DEL SISTEMA
# ============================================================================

cat("PASO 5: Información del sistema...\n")
cat("  Sistema operativo:", Sys.info()["sysname"], "\n")
cat("  Directorio de trabajo:", getwd(), "\n\n")

# ============================================================================
# 7. RESUMEN Y PRÓXIMOS PASOS
# ============================================================================

cat("============================================\n")
cat("✓ CONFIGURACIÓN COMPLETADA EXITOSAMENTE\n")
cat("============================================\n\n")

cat("PRÓXIMOS PASOS:\n\n")
cat("1. Navegar a la carpeta de análisis cuantitativo:\n")
cat("   setwd('Analysis_Quantitative')\n\n")
cat("2. Ejecutar los scripts en orden:\n")
cat("   source('01_GenDataSet.R')        # Generar datasets\n")
cat("   source('02_Gen_Graph_RIEN.R')    # Gráficos RIEN\n")
cat("   source('03_Gen_Graph_GABAS.R')   # Gráficos GABAS\n")
cat("   source('04_Gen_Graph_Nutrients.R') # Heatmap nutricional\n\n")
cat("3. Los gráficos se guardarán en:\n")
cat("   Analysis_Quantitative/graphs/\n\n")

cat("============================================\n")
cat("Para más información, consulte:\n")
cat("  - README.md (raíz del proyecto)\n")
cat("  - Analysis_Quantitative/README.md\n")
cat("============================================\n\n")

# ============================================================================
# FUNCIÓN AUXILIAR: EJECUTAR ANÁLISIS COMPLETO
# ============================================================================

run_full_analysis <- function() {
  cat("\n=== EJECUTANDO ANÁLISIS COMPLETO ===\n\n")
  
  # Cambiar al directorio de análisis cuantitativo
  original_dir <- getwd()
  setwd("Analysis_Quantitative")
  
  # Ejecutar scripts en orden
  cat("Ejecutando 01_GenDataSet.R...\n")
  source("01_GenDataSet.R")
  
  cat("\nEjecutando 02_Gen_Graph_RIEN.R...\n")
  source("02_Gen_Graph_RIEN.R")
  
  cat("\nEjecutando 03_Gen_Graph_GABAS.R...\n")
  source("03_Gen_Graph_GABAS.R")
  
  cat("\nEjecutando 04_Gen_Graph_Nutrients.R...\n")
  source("04_Gen_Graph_Nutrients.R")
  
  # Regresar al directorio original
  setwd(original_dir)
  
  cat("\n✓ ANÁLISIS COMPLETO FINALIZADO\n")
  cat("  Ver resultados en: Analysis_Quantitative/graphs/\n\n")
}

cat("TIP: Para ejecutar todo el análisis de una vez, use:\n")
cat("     run_full_analysis()\n\n")
