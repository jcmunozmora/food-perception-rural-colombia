# ============================================================================
# SCRIPT 0: LIBRERÍAS REQUERIDAS PARA ANÁLISIS CUANTITATIVO
# ============================================================================
# Descripción: Instalar y cargar todas las librerías necesarias para el
#              análisis de benchmarking nutricional
# Autores: Arcila-Agudelo, A.M., Cardona-Trujillo, H., et al.
# Fecha: 2024-2026
# ============================================================================

# Verificar e instalar librerías faltantes
required_packages <- c("tidyverse", "hrbrthemes", "readxl", "reshape2", 
                       "ggplot2", "writexl")

new_packages <- required_packages[!(required_packages %in% 
                                     installed.packages()[,"Package"])]
if(length(new_packages)) {
  install.packages(new_packages)
  cat("✓ Paquetes instalados:", paste(new_packages, collapse = ", "), "\n")
}

# Cargar librerías
suppressPackageStartupMessages({
  library(tidyverse)      # Manipulación de datos y gráficos
  library(hrbrthemes)     # Temas modernos para ggplot2
  library(readxl)         # Lectura de archivos Excel
  library(reshape2)       # Reformateo de datos (wide-long)
  library(ggplot2)        # Visualización de datos
  library(writexl)        # Escritura de archivos Excel
})

cat("✓ Todas las librerías cargadas correctamente\n")
cat("============================================\n")
cat("Sistema listo para análisis cuantitativo\n")
cat("============================================\n")