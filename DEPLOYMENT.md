# 🚀 Deployment Guide - GitHub Pages

This guide will help you publish the supplementary materials website using GitHub Pages.

---

## 📋 Prerequisites

- Repository uploaded to GitHub
- Administrator permissions on the repository

---

## ⚙️ GitHub Pages Configuration

### Step 1: Upload Repository to GitHub

If you haven't done so yet:

```bash
# Initialize Git (if not initialized)
git init

# Add all files
git add .

# Initial commit
git commit -m "Initial commit: Setup supplementary materials website"

# Add remote (replace with your GitHub URL)
git remote add origin https://github.com/jcmunozmora/food-perception-rural-colombia.git

# Upload to GitHub
git push -u origin main
```

---

### Step 2: Activate GitHub Pages

1. Go to your repository on GitHub
2. Click on **Settings** (⚙️)
3. In the sidebar, click on **Pages**
4. Under **Source**, select:
   - **Branch:** `main`
   - **Folder:** `/ (root)`
5. Click **Save**

GitHub will begin building the site. This may take 1-2 minutes.

---

### Step 3: Verify the Site

Your site will be available at:
```
https://jcmunozmora.github.io/food-perception-rural-colombia/
```

GitHub Pages automatically:
- ✅ Renders `README.md` as main page
- ✅ Applies theme specified in `_config.yml`
- ✅ Generates folder navigation

---

## 🎨 Advanced Customization (Optional)

### Change Theme

Edit `_config.yml`:

```yaml
# Available themes:
theme: minima          # Default theme (recommended)
# theme: cayman        # Alternative 1
# theme: slate         # Alternative 2
# theme: modernist     # Alternative 3
```

See all themes: https://pages.github.com/themes/

---

### Add Custom Domain

If you have your own domain:

1. In **Settings → Pages**, add under **Custom domain**
2. Create `CNAME` file in root with your domain:
   ```
   supplementary.yourdomain.com
   ```
3. Configure DNS according to [GitHub documentation](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site)

---

### Enable HTTPS

1. In **Settings → Pages**
2. Check **Enforce HTTPS** box
3. Wait for SSL certificate to generate (may take up to 24 hours)

---

## 📊 Website Structure

Once published, the site will have this navigation structure:

```
Main Page (README.md)
├── Quantitative Analysis/
│   ├── README.md (documentation)
│   └── graphs/ (graphs)
├── Qualitative Analysis/
│   └── README.md
├── Workshop Forms/
│   ├── README.md
│   └── Downloadable PDFs
├── Evidence and Transcriptions/
│   ├── README.md
│   └── Pictures/ (browsable photos)
└── Quick Start Guide (QUICKSTART.md)
```

---

## 🔗 Important Links to Update

Once deployed, update these links in your documentation:

### In main README:
- Replace `[Journal Name]` with journal name when published
- Verify all contact emails are updated

### In _config.yml:
```yaml
author:
  name: Ana María Arcila-Agudelo et al.
  email: ana.arcila@uniremington.edu.co
```

---

## 📈 Analytics (Optional)

To track site visits:

### Google Analytics

1. Create a Google Analytics account
2. Get your Tracking ID
3. Add to `_config.yml`:
   ```yaml
   google_analytics: UA-XXXXXXXXX-X
   ```

---

## 🛠️ Maintenance and Updates

### To update the site:

```bash
# Make changes to local files
# ...

# Add changes
git add .

# Commit with descriptive message
git commit -m "docs: update analysis results"

# Push to GitHub
git push origin main
```

GitHub Pages will update automatically in 1-2 minutes.

---

## ✅ Deployment Checklist

Before announcing the site publicly:

- [ ] GitHub Pages activated and working
- [ ] README.md looks good on main page
- [ ] All internal links work
- [ ] PDFs and graphs are accessible
- [ ] Images load correctly
- [ ] No sensitive information exposed
- [ ] Contact emails updated
- [ ] License clearly visible
- [ ] CITATION.cff configured
- [ ] .gitignore prevents uploading sensitive files
- [ ] HTTPS enabled (if possible)
- [ ] Social metadata (optional, see below)

---

## 🌐 Social Metadata (Optional but Recommended)

To improve how the site appears when shared on social media:

Add to `_config.yml`:

```yaml
# Open Graph metadata
title: "Healthy is fresh - Rural Colombia Food Study"
description: "Online supplementary materials for participatory study of meal ideals and barriers shaping food choice in rural Colombia"
logo: /assets/images/logo.png  # If you have a logo
social:
  name: Universidad EAFIT
  links:
    - https://github.com/jcmunozmora
```

---

## 🐛 Troubleshooting

### Site doesn't load

**Symptoms:** 404 error when visiting URL

**Solutions:**
1. Verify GitHub Pages is activated in Settings
2. Wait 5-10 minutes (deployment may take time)
3. Verify branch is `main` not `master`
4. Hard refresh: Ctrl+Shift+R (Windows) or Cmd+Shift+R (Mac)

### Files don't update

**Solutions:**
1. Verify you did `git push` correctly
2. Clear browser cache
3. Wait 2-3 minutes between changes

### Images don't display

**Solutions:**
1. Verify markdown paths: should be relative
2. Ensure images are in the repository
3. Verify filenames don't have spaces

### CSS/theme doesn't apply

**Solutions:**
1. Verify `_config.yml` is in root
2. Verify YAML syntax (correct indentation)
3. Try `minima` theme (more stable)

---

## 📱 Mobile Optimization

GitHub Pages with Jekyll automatically generates responsive sites. To verify:

1. Open site on mobile
2. Use Chrome Developer Tools (F12 → Toggle device toolbar)
3. Test on different screen sizes

---

## 🔒 Security

### Verify NO sensitive information is exposed:

```bash
# Search for possible personal emails
grep -r "@" --include="*.md" --include="*.txt" .

# Search for possible participant names
grep -ri "participant\|name\|surname" Transcriptions/
```

### Ensure .gitignore works:

```bash
# See which files are tracked
git ls-files

# Verify complete transcriptions are NOT included
git ls-files | grep -i transcription
```

---

## 📊 Issue Monitoring

Once public, monitor:
- [Open Issues](https://github.com/jcmunozmora/food-perception-rural-colombia/issues)
- [Pull Requests](https://github.com/jcmunozmora/food-perception-rural-colombia/pulls)
- Forks and Stars (interest indicators)

---

## 🎯 Site Promotion

Once deployed, share:

### In the paper:
```
Supplementary materials available at:
https://jcmunozmora.github.io/food-perception-rural-colombia
```

### On social media:
```
🔍 Supplementary materials of the "Healthy is fresh" study now available:
📊 Reproducible analyses
📋 Workshop forms
📸 Visual evidence
🔓 Open data

👉 https://jcmunozmora.github.io/food-perception-rural-colombia

#OpenScience #FoodSystems #Colombia
```

### On your institutional profile:
- Personal website
- ResearchGate
- ORCID
- Google Scholar

---

## 📧 Contact for Deployment Support

If you have technical problems with GitHub Pages:
- [Official documentation](https://docs.github.com/en/pages)
- [GitHub Community](https://github.community/)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/github-pages)

---

**Your site is ready to be published!** 🎉

Next step: Execute deployment checklist and activate GitHub Pages.

---

**Last updated:** February 2026
