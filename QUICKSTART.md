# 🚀 Quick Start Guide

This guide will help you start working with the supplementary materials of the **"Healthy is fresh"** study in less than 10 minutes.

---

## 📋 Prerequisites

### Required Software

- **R** (version 4.0 or higher) - [Download here](https://www.r-project.org/)
- **RStudio** (recommended) - [Download here](https://posit.co/download/rstudio-desktop/)
- **Git** (optional, to clone repository) - [Download here](https://git-scm.com/)

### Alternative Without R

If you only want to explore materials without running analyses:
- Review [generated graphs](Analysis_Quantitative/graphs/)
- Review [workshop photographs](Participatory_Workshop_Evidence-Transcriptions/Pictures/)
- Read [documentation in each folder](#repository-structure)

---

## ⚡ Quick Start (3 steps)

### 1️⃣ Get the Repository

**Option A: Clone with Git**
```bash
git clone https://github.com/jcmunozmora/food-perception-rural-colombia.git
cd food-perception-rural-colombia
```

**Option B: Download ZIP**
1. Click the green **"Code"** button on GitHub
2. Select **"Download ZIP"**
3. Extract the file on your computer

---

### 2️⃣ Configure R Environment

Open **RStudio** and run:

```r
# Set working directory
setwd("path/to/food-perception-rural-colombia")

# Run automatic setup
source("setup.R")
```

This script:
- ✅ Verifies your R version
- ✅ Installs required packages automatically
- ✅ Loads libraries
- ✅ Verifies project structure
- ✅ Creates necessary folders

**Estimated time:** 2-3 minutes

---

### 3️⃣ Run Analysis

**Option A: Full Analysis (Automatic)**

```r
# Run everything at once
run_full_analysis()
```

**Option B: Step by Step (Manual)**

```r
# Navigate to analysis folder
setwd("Analysis_Quantitative")

# Step 1: Generate processed datasets
source("01_GenDataSet.R")

# Step 2: Generate RIEN graphs (nutritional adequacy)
source("02_Gen_Graph_RIEN.R")

# Step 3: Generate GABAS graphs (food groups)
source("03_Gen_Graph_GABAS.R")

# Step 4: Generate nutritional heatmap
source("04_Gen_Graph_Nutrients.R")
```

**Estimated time:** 2-3 minutes

---

## 📂 Repository Structure

```
food-perception-rural-colombia/
├── README.md                              # Main page
├── WORKSHOP.md                            # ⭐ Complete visual workshop documentation
├── QUICKSTART.md                          # This guide
├── setup.R                                # Automatic setup
├── _config.yml                            # GitHub Pages configuration
│
├── Analysis_Quantitative/                 # 📊 Quantitative analysis
│   ├── README.md                          # Detailed documentation
│   ├── 01_GenDataSet.R                    # Dataset generation
│   ├── 02_Gen_Graph_RIEN.R                # RIEN graphs
│   ├── 03_Gen_Graph_GABAS.R               # GABAS graphs
│   ├── 04_Gen_Graph_Nutrients.R           # Nutritional heatmap
│   ├── Bases de datos.xlsx                # Primary data
│   └── graphs/                            # Generated graphs
│
├── Analysis_Qualitative/                  # 📝 Qualitative analysis
│   ├── README.md                          # Documentation
│   ├── Barreras dieta saludable.xlsx      # Coded barriers
│   └── Información Sociodemografica.xlsx  # Participant info
│
├── Participatory_Workshop_Forms/          # 📋 Workshop forms
│   ├── README.md
│   ├── desayuno, almuerzo, comida, barreras.pdf
│   ├── Cuadro registro.pdf
│   └── extras.pdf
│
├── Participatory_Workshop_Evidence-Transcriptions/  # 📸 Evidence
│   ├── README.md
│   ├── Pictures/                          # Co-designed meal photos
│   └── Transcriptions/                    # Transcriptions (restricted)
│
└── Participatory_Workshops_Design/        # 🎨 Methodological design
    └── Notas para Diseño de talleres 1.docx
```

---

## 🎯 Common Use Cases

### Use Case 1: I want to understand how the workshops functioned

📖 **[Read the complete visual workshop documentation](WORKSHOP.md)**

Includes:
- Step-by-step process with real photographs
- Examples of participant co-designed meals
- Downloadable materials
- Key findings and lessons learned

---

### Use Case 2: I want to reproduce the paper's analyses

```r
source("setup.R")
run_full_analysis()
```

Review results in: `Analysis_Quantitative/graphs/`

---

### Use Case 3: I just want to see results (without code)

Navigate directly to:
- 🎨 [**Visual workshop documentation**](WORKSHOP.md) with meal photos
- 📊 [Nutritional graphs](Analysis_Quantitative/graphs/)
- 📸 [Co-designed meal photos](Participatory_Workshop_Evidence-Transcriptions/Pictures/)
- 📄 [Complete paper](Arcila_etat_2026.pdf)

---

### Use Case 4: I want to use the forms in my own study

1. Review: [Participatory_Workshop_Forms](Participatory_Workshop_Forms/)
2. Read the methodological design documentation
3. Adapt materials to your context
4. **Important:** Cite the original study:

```
Arcila-Agudelo, A.M. et al. (2026). "Healthy is fresh": A participatory study 
of meal ideals and barriers shaping food choice in rural Colombia.
```

---

### Use Case 5: I want to access complete transcriptions

Complete transcriptions are **not publicly available** for ethical reasons (re-identification risk).

**To request access:**
1. Send email to: ana.arcila@uniremington.edu.co
2. Subject: "Access Request - Rural Colombia Transcriptions"
3. Include:
   - Purpose of use
   - Institutional affiliation
   - Ethics committee approval (if applicable)

---

## 📊 Expected Outputs

After running the analyses, you should see:

### Processed Datasets
- `DS_Talleres_RIEN.rds` / `.xlsx` (nutritional adequacy)
- `DS_Talleres_GABAS.rds` / `.xlsx` (food groups)

### RIEN Graphs
- `reg_Calorias.png`
- `reg_Proteina.png`
- `reg_CHO.png`
- `reg_Grasas.png`
- `reg_Fibra.png`
- `reg_Calcio.png`
- `reg_Hierro.png`
- `reg_Sodio.png`
- `ALL_Macronutrientes.png`
- `ALL_Micronutrientes.png`

### GABAS Graphs
- `reg_GABAS.png`
- `ALL_GABAS.png`

### Nutritional Heatmap
- `panel_b_heatmap.pdf` (used in the article)
- `panel_b_heatmap.png`

---

## 🐛 Troubleshooting

### Problem: Error installing packages

**Solution:**
```r
# Try manual installation
install.packages(c("tidyverse", "hrbrthemes", "readxl", 
                   "writexl", "reshape2", "ggplot2"))
```

### Problem: "Cannot find file Bases de datos.xlsx"

**Solution:**
Verify you're in the correct directory:
```r
getwd()  # Should show project folder
setwd("correct/path/to/project")
```

### Problem: Graphs are not generated

**Solution:**
Verify the `graphs/` folder exists:
```r
dir.create("Analysis_Quantitative/graphs", recursive = TRUE)
```

### Problem: R version too old

**Solution:**
Download R 4.0 or higher from: https://www.r-project.org/

---

## 📚 Additional Documentation

For more detailed information, consult:

- 📄 [Main README](README.md) - Complete study summary
- 📊 [Quantitative Analysis README](Analysis_Quantitative/README.md) - Technical details
- 📝 [Qualitative Analysis README](Analysis_Qualitative/README.md) - Qualitative methodology
- 📋 [Forms README](Participatory_Workshop_Forms/README.md) - Workshop materials
- 📸 [Evidence README](Participatory_Workshop_Evidence-Transcriptions/README.md) - Photos and transcriptions

---

## 💡 Useful Tips

### View all available scripts
```r
list.files("Analysis_Quantitative", pattern = "\\.R$")
```

### View dataset structure
```r
library(tidyverse)
ds_RIEN <- read_rds("Analysis_Quantitative/DS_Talleres_RIEN.rds")
glimpse(ds_RIEN)
```

### Export graphs in high resolution
```r
ggsave("my_graph.png", width = 12, height = 8, dpi = 300)
```

---

## 📖 How to Cite

```bibtex
@article{arcila2026healthy,
  title={"Healthy is fresh": A participatory study of meal ideals 
         and barriers shaping food choice in rural Colombia},
  author={Arcila, D. et al.},
  journal={[Journal Name]},
  year={2026}
}
```

GitHub automatically recognizes [CITATION.cff](CITATION.cff) to facilitate citation.

---

## 🆘 Help and Support

### Frequently Asked Questions

Check the repository [Issues](https://github.com/jcmunozmora/food-perception-rural-colombia/issues) - your question may have already been answered!

### Report a Problem

Found a bug or error in the code?
1. Open an [Issue](https://github.com/jcmunozmora/food-perception-rural-colombia/issues/new)
2. Describe the problem clearly
3. Include error messages if any

### Contact

For questions about the study or data requests:
- 📧 Email: ana.arcila@uniremington.edu.co (Ana María Arcila-Agudelo)
- 📧 Alternative email: jmunozm1@eafit.edu.co (Juan Carlos Muñoz-Mora)
- 🌐 Web: https://jcmunozmora.github.io/food-perception-rural-colombia

---

## ⚖️ License

This project is licensed under **Creative Commons Attribution 4.0 International (CC BY 4.0)**.

You are free to share and adapt these materials with proper attribution.

See: [LICENSE.md](LICENSE.md)

---

**Ready to start!** 🎉

If you have any questions, don't hesitate to open an Issue or contact us directly.

---

**Last updated:** February 2026
