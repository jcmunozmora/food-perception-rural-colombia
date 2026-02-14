# Guía de Contribución

¡Gracias por tu interés en contribuir al proyecto **"Healthy is fresh" - Rural Colombia Food Study**! 

Este documento proporciona lineamientos para diferentes tipos de contribuciones.

---

## 🤝 Tipos de Contribuciones Bienvenidas

### 1. ✅ Reportar Errores o Bugs

Si encuentras un error en el código, documentación o datos:

1. **Verifica** que el error no haya sido reportado previamente en [Issues](https://github.com/jcmunozmora/food-perception-rural-colombia/issues)
2. **Abre un nuevo Issue** con:
   - Título descriptivo (ej: "Error en script 02: NAs no manejados")
   - Descripción clara del problema
   - Pasos para reproducir el error
   - Salida esperada vs. salida actual
   - Información del sistema (versión R, OS)

**Ejemplo:**
```
Título: Error en 04_Gen_Graph_Nutrients.R al calcular % Calcio

Descripción: El script falla con error "object 'Calcio_EAR' not found" 
en línea 45.

Para reproducir:
1. Ejecutar setup.R
2. Ejecutar 01_GenDataSet.R
3. Ejecutar 04_Gen_Graph_Nutrients.R
4. Error aparece en línea 45

Sistema: R 4.3.0, macOS Ventura 13.4
```

---

### 2. 📝 Mejorar Documentación

¿Encontraste partes confusas o faltantes en la documentación?

**Áreas bienvenidas:**
- Clarificar instrucciones en READMEs
- Agregar ejemplos de uso
- Corregir errores tipográficos
- Traducir documentación a otros idiomas
- Mejorar comentarios en código

**Proceso:**
1. Fork el repositorio
2. Crea una rama: `git checkout -b docs/descripcion-mejora`
3. Realiza los cambios
4. Commit: `git commit -m "docs: clarifica instalación de paquetes"`
5. Push: `git push origin docs/descripcion-mejora`
6. Abre un Pull Request

---

### 3. 🐛 Corregir Bugs

Si encuentras y sabes cómo corregir un bug:

**Proceso:**
1. Abre un Issue describiendo el bug (si no existe)
2. Fork el repositorio
3. Crea una rama: `git checkout -b fix/nombre-bug`
4. Corrige el bug
5. Agrega comentarios explicando la corrección
6. Commit: `git commit -m "fix: maneja NAs en cálculo de adecuación"`
7. Abre un Pull Request referenciando el Issue

---

### 4. ✨ Agregar Nuevas Funcionalidades

¿Tienes ideas para extender los análisis?

**Antes de empezar:**
1. Abre un Issue describiendo la funcionalidad propuesta
2. Espera feedback del equipo
3. Discute el approach técnico

**Funcionalidades bienvenidas:**
- Nuevas visualizaciones
- Análisis estadísticos complementarios
- Scripts de validación de datos
- Herramientas auxiliares

**Proceso:**
1. Fork y crea rama: `git checkout -b feature/nombre-funcionalidad`
2. Implementa la funcionalidad
3. Documenta el código (comentarios inline + README)
4. Agrega ejemplos de uso
5. Commit: `git commit -m "feat: agrega análisis de varianza por región"`
6. Abre Pull Request con descripción detallada

---

### 5. 📊 Compartir Adaptaciones

¿Has adaptado los materiales para otro contexto?

**Contribuciones valiosas:**
- Formularios traducidos a otros idiomas
- Adaptaciones para contextos urbanos
- Scripts modificados para otras tablas de composición
- Materiales adaptados para otros grupos etarios

**Proceso:**
1. Documenta claramente las adaptaciones
2. Incluye contexto de uso
3. Abre un Pull Request o Issue compartiendo el trabajo
4. El equipo evaluará si incorporarlo al repositorio principal o linkear como recurso externo

---

## 📋 Estándares de Código

### R Scripts

#### Estilo
- **Indentación:** 2 espacios
- **Nombres de variables:** snake_case (`mi_variable`)
- **Nombres de funciones:** snake_case (`calcular_adecuacion()`)
- **Comentarios:** En español, claros y concisos

#### Estructura de scripts
```r
# ============================================================================
# TÍTULO DEL SCRIPT
# ============================================================================
# Descripción: Breve descripción del propósito
# Input: Archivos de entrada necesarios
# Output: Archivos generados
# Autor: [Nombre]
# Fecha: [Fecha]
# ============================================================================

# Cargar librerías necesarias
library(tidyverse)
library(...)

# Limpiar entorno (si aplica)
rm(list = ls())

# ============================================================================
# SECCIÓN 1: DESCRIPCIÓN
# ============================================================================

# Código con comentarios inline cuando sea necesario
resultado <- funcion(datos)

# ...

# ============================================================================
# GUARDAR RESULTADOS
# ============================================================================

write_rds(resultado, "output.rds")
```

#### Funciones
```r
# Documentar parámetros y retorno
calcular_adecuacion <- function(valor, referencia) {
  # Calcula % de adecuación respecto a referencia RIEN
  #
  # Args:
  #   valor: Valor observado (numérico)
  #   referencia: Valor de referencia RIEN (numérico)
  #
  # Returns:
  #   Porcentaje de adecuación (numérico)
  
  (valor / referencia) * 100
}
```

---

### Markdown (Documentación)

- **Títulos:** Usar jerarquía clara (`#`, `##`, `###`)
- **Listas:** Usar viñetas (`-`) o números (`1.`)
- **Código:** Usar bloques con syntax highlighting
- **Enlaces:** Usar rutas relativas dentro del repositorio
- **Emojis:** OK para mejorar legibilidad, con moderación

---

## 🔍 Proceso de Revisión de Pull Requests

### Qué revisamos:

1. **Funcionalidad:** ¿El código hace lo que promete?
2. **Claridad:** ¿Es fácil de entender?
3. **Documentación:** ¿Está bien documentado?
4. **Compatibilidad:** ¿Es compatible con el resto del código?
5. **Estilo:** ¿Sigue los estándares del proyecto?

### Tiempos de respuesta:

- Primera revisión: ~1 semana
- Feedback iterativo: ~3-5 días entre rondas
- Merge: cuando aprueben 2 reviewers

---

## 🚫 Qué NO contribuir

### Cambios no aceptados:

- ❌ Datos identificables de participantes
- ❌ Transcripciones completas sin anonimizar
- ❌ Cambios que rompan reproduc ibilidad de análisis publicados
- ❌ Código sin documentación
- ❌ Cambios cosméticos masivos sin valor funcional

---

## ⚖️ Consideraciones Éticas

### Al contribuir, debes:

- ✅ Respetar la privacidad de los participantes originales
- ✅ No intentar re-identificar participantes a partir de datos anonimizados
- ✅ Citar apropiadamente el estudio original
- ✅ Mantener la licencia CC BY 4.0 en materiales derivados
- ✅ Declarar conflictos de interés si los hay

---

## 📖 Recursos Útiles

### Aprende Git y GitHub
- [GitHub Guides](https://guides.github.com/)
- [Pro Git Book (español)](https://git-scm.com/book/es/v2)

### Aprende R
- [R for Data Science](https://r4ds.had.co.nz/)
- [R Style Guide (Tidyverse)](https://style.tidyverse.org/)

### Aprende Markdown
- [Markdown Guide](https://www.markdownguide.org/)

---

## 🙏 Reconocimientos

Todos los contribuidores serán reconocidos en:
- Sección "Contributors" de GitHub (automático)
- README principal del proyecto
- Sección de agradecimientos en futuras publicaciones (según magnitud de contribución)

---

## 📧 Preguntas

¿Tienes dudas sobre cómo contribuir?

- Abre un [Issue de pregunta](https://github.com/jcmunozmora/food-perception-rural-colombia/issues/new)
- Escribe a: ana.arcila@uniremington.edu.co o jmunozm1@eafit.edu.co

---

## ✍️ Compromiso con la Comunidad

Nos comprometemos a:
- 🤝 Ser respetuosos y constructivos en feedback
- ⏱️ Responder oportunamente a Issues y PRs
- 📚 Mantener documentación actualizada
- 🌍 Fomentar diversidad de perspectivas y contribuidores

---

**¡Gracias por ayudar a mejorar este proyecto!** 🎉

---

**Última actualización:** Febrero 2026
