# 🚀 Guía de Deployment - GitHub Pages

Esta guía te ayudará a publicar el sitio web de materiales suplementarios usando GitHub Pages.

---

## 📋 Pre-requisitos

- Repositorio subido a GitHub
- Permisos de administrador en el repositorio

---

## ⚙️ Configuración de GitHub Pages

### Paso 1: Subir el Repositorio a GitHub

Si aún no lo has hecho:

```bash
# Inicializar Git (si no está inicializado)
git init

# Agregar todos los archivos
git add .

# Hacer commit inicial
git commit -m "Initial commit: Setup supplementary materials website"

# Agregar remote (reemplaza con tu URL de GitHub)
git remote add origin https://github.com/jcmunozmora/food-perception-rural-colombia.git

# Subir a GitHub
git push -u origin main
```

---

### Paso 2: Activar GitHub Pages

1. Ve a tu repositorio en GitHub
2. Click en **Settings** (⚙️)
3. En el menú lateral, click en **Pages**
4. En **Source**, selecciona:
   - **Branch:** `main`
   - **Folder:** `/ (root)`
5. Click en **Save**

GitHub comenzará a construir el sitio. Esto puede tomar 1-2 minutos.

---

### Paso 3: Verificar el Sitio

Tu sitio estará disponible en:
```
https://jcmunozmora.github.io/food-perception-rural-colombia/
```

GitHub Pages automáticamente:
- ✅ Renderiza `README.md` como página principal
- ✅ Aplica el tema especificado en `_config.yml`
- ✅ Genera navegación de carpetas

---

## 🎨 Personalización Avanzada (Opcional)

### Cambiar el Tema

Edita `_config.yml`:

```yaml
# Temas disponibles:
theme: minima          # Tema por defecto (recomendado)
# theme: cayman        # Alternativa 1
# theme: slate         # Alternativa 2
# theme: modernist     # Alternativa 3
```

Ver todos los temas: https://pages.github.com/themes/

---

### Agregar Dominio Personalizado

Si tienes un dominio propio:

1. En **Settings → Pages**, agregar en **Custom domain**
2. Crear archivo `CNAME` en la raíz con tu dominio:
   ```
   suplementarios.tudominio.com
   ```
3. Configurar DNS según [documentación de GitHub](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site)

---

### Habilitar HTTPS

1. En **Settings → Pages**
2. Marca la casilla **Enforce HTTPS**
3. Espera a que se genere el certificado SSL (puede tomar hasta 24 horas)

---

## 📊 Estructura del Sitio Web

Una vez publicado, el sitio tendrá esta estructura de navegación:

```
Página Principal (README.md)
├── Análisis Cuantitativo/
│   ├── README.md (documentación)
│   └── graphs/ (gráficos)
├── Análisis Cualitativo/
│   └── README.md
├── Formularios de Talleres/
│   ├── README.md
│   └── PDFs descargables
├── Evidencias y Transcripciones/
│   ├── README.md
│   └── Pictures/ (fotos navegables)
└── Guía de Inicio Rápido (QUICKSTART.md)
```

---

## 🔗 Enlaces Importantes a Actualizar

Una vez desplegado, actualiza estos enlaces en tu documentación:

### En el README principal:
- Reemplaza `[Journal Name]` con el nombre de la revista cuando se publique
- Verifica que todos los emails de contacto estén actualizados

### En _config.yml:
```yaml
author:
  name: Ana María Arcila-Agudelo et al.
  email: ana.arcila@uniremington.edu.co
```

---

## 📈 Analíticas (Opcional)

Para rastrear visitas al sitio:

### Google Analytics

1. Crea una cuenta en Google Analytics
2. Obtén tu Tracking ID
3. Agrega a `_config.yml`:
   ```yaml
   google_analytics: UA-XXXXXXXXX-X
   ```

---

## 🛠️ Mantenimiento y Actualizaciones

### Para actualizar el sitio:

```bash
# Hacer cambios en archivos locales
# ...

# Agregar cambios
git add .

# Commit con mensaje descriptivo
git commit -m "docs: actualiza resultados de análisis"

# Subir a GitHub
git push origin main
```

GitHub Pages se actualizará automáticamente en 1-2 minutos.

---

## ✅ Checklist de Deployment

Antes de anunciar el sitio públicamente:

- [ ] GitHub Pages activado y funcionando
- [ ] README.md se ve bien en la página principal
- [ ] Todos los enlaces internos funcionan
- [ ] Los PDFs y gráficos son accesibles
- [ ] Las imágenes se cargan correctamente
- [ ] No hay información sensible expuesta
- [ ] Emails de contacto actualizados
- [ ] Licencia claramente visible
- [ ] CITATION.cff configurado
- [ ] .gitignore evita subir archivos sensibles
- [ ] HTTPS habilitado (si es posible)
- [ ] Metadatos sociales (opcional, ver abajo)

---

## 🌐 Metadatos Sociales (Opcional pero Recomendado)

Para mejorar cómo se ve el sitio cuando se comparte en redes sociales:

Agrega a `_config.yml`:

```yaml
# Metadatos Open Graph
title: "Healthy is fresh - Rural Colombia Food Study"
description: "Online supplementary materials for participatory study of meal ideals and barriers shaping food choice in rural Colombia"
logo: /assets/images/logo.png  # Si tienes un logo
social:
  name: Universidad EAFIT
  links:
    - https://github.com/jcmunozmora
```

---

## 🐛 Troubleshooting

### El sitio no carga

**Síntomas:** Error 404 al visitar la URL

**Soluciones:**
1. Verifica que GitHub Pages esté activado en Settings
2. Espera 5-10 minutos (el deploy puede tardar)
3. Verifica que el branch sea `main` y no `master`
4. Hard refresh: Ctrl+Shift+R (Windows) o Cmd+Shift+R (Mac)

### Los archivos no se actualizan

**Soluciones:**
1. Verifica que hiciste `git push` correctamente
2. Limpia caché del navegador
3. Espera 2-3 minutos entre cambios

### Las imágenes no se muestran

**Soluciones:**
1. Verifica las rutas en markdown: deben ser relativas
2. Asegúrate de que las imágenes estén en el repositorio
3. Verifica que los nombres de archivo no tengan espacios

### El CSS/tema no se aplica

**Soluciones:**
1. Verifica que `_config.yml` esté en la raíz
2. Verifica sintaxis YAML (indentación correcta)
3. Prueba con tema `minima` (más estable)

---

## 📱 Optimización Móvil

GitHub Pages con Jekyll automáticamente genera sitios responsive. Para verificar:

1. Abre el sitio en móvil
2. Usa las Developer Tools de Chrome (F12 → Toggle device toolbar)
3. Prueba en diferentes tamaños de pantalla

---

## 🔒 Seguridad

### Verificar que NO se expone información sensible:

```bash
# Buscar posibles emails personales
grep -r "@" --include="*.md" --include="*.txt" .

# Buscar posibles nombres de participantes
grep -ri "participante\|nombre\|apellido" Transcriptions/
```

### Asegúrate de que .gitignore funciona:

```bash
# Ver qué archivos están trackeados
git ls-files

# Verificar que transcripciones completas NO están incluidas
git ls-files | grep -i transcription
```

---

## 📊 Monitoreo de Issues

Una vez público, monitorea:
- [Issues abiertos](https://github.com/jcmunozmora/food-perception-rural-colombia/issues)
- [Pull Requests](https://github.com/jcmunozmora/food-perception-rural-colombia/pulls)
- Forks y Stars (indicadores de interés)

---

## 🎯 Promoción del Sitio

Una vez desplegado, comparte:

### En el paper:
```
Supplementary materials available at:
https://jcmunozmora.github.io/food-perception-rural-colombia
```

### En redes sociales:
```
🔍 Materiales suplementarios del estudio "Healthy is fresh" ya disponibles:
📊 Análisis reproducibles
📋 Formularios de talleres
📸 Evidencias visuales
🔓 Datos abiertos

👉 https://jcmunozmora.github.io/food-perception-rural-colombia

#OpenScience #FoodSystems #Colombia
```

### En tu perfil institucional:
- Página web personal
- ResearchGate
- ORCID
- Google Scholar

---

## 📧 Contacto para Soporte de Deployment

Si tienes problemas técnicos con GitHub Pages:
- [Documentación oficial](https://docs.github.com/en/pages)
- [Comunidad GitHub](https://github.community/)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/github-pages)

---

**¡Tu sitio está listo para ser publicado!** 🎉

Siguiente paso: Ejecutar el checklist de deployment y activar GitHub Pages.

---

**Última actualización:** Febrero 2026
