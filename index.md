---
layout: default
title: Home
---

# "Healthy is fresh": A participatory study of meal ideals and barriers shaping food choice in rural Colombia

## Online Supplementary Materials

[![Paper](https://img.shields.io/badge/Paper-PDF-red.svg)](Arcila_etat_2026.pdf)
[![License](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by/4.0/)
[![GitHub](https://img.shields.io/badge/GitHub-Repository-blue.svg)](https://github.com/jcmunozmora/food-perception-rural-colombia)

---

## Quick Navigation

- [Study Overview](#study-overview) - Research design & key findings
- [Quantitative Analysis](#quantitative-analysis) - Nutritional benchmarking
- [Qualitative Analysis](#qualitative-analysis) - Thematic coding & insights  
- [Workshop Gallery](WORKSHOP.md) - Photos & methodology
- [Quick Start](QUICKSTART.md) - Reproduce the analysis
- [Open Data](#open-data) - Datasets & scripts

---

## 👥 Authors

**Ana María Arcila-Agudelo¹*, Harold Cardona-Trujillo², Ana Sofia Herazo-Castelblanco³, María Claudia Mejía-Gil⁴, Juan Carlos Muñoz-Mora⁵, Tatiana Ortiz-Pradilla⁶**

<details>
<summary><strong>View affiliations</strong></summary>

¹ Corporación Universitaria Remington  
² ³ ⁵ Universidad EAFIT (Centro de Valor Público)  
⁴ ⁶ Universidad EAFIT (Mercadeo e Innovación)

*Corresponding author: ana.arcila@uniremington.edu.co

📄 [Complete author information](AUTHORS.md)

</details>

---

## 📄 Abstract

People often use simple rules of thumb to decide what to eat, yet these "healthy eating" beliefs can drift away from everyday constraints. In rural Colombia, we explored how adults define healthy eating, what an "ideal day of eating" looks like in practice, and which barriers shape food choice and intake. We conducted participatory co-design workshops with 41 adults (18–70 years) across three rural subregions of Antioquia. Using visual food models, groups built ideal meals and menus, rated how closely their usual diets matched those ideals (1–5 scale), and discussed what helps or hinders alignment. We then used Colombian food composition data to benchmark the co-designed menus against national food-based dietary guidelines and recommended nutrient intakes. Participants consistently framed healthy eating as "fresh" and "home-prepared," but their ideals often left less room for vegetables and dairy than guidelines suggest and tended to exceed recommended sodium limits. Self-ratings clustered around 2.5–3.5/5, pointing to a perceived gap between intentions and everyday eating. Barriers were described less as a lack of knowledge and more as affordability, limited access and time, entrenched habits, and emotional strain. Pairing participatory elicitation of meal ideals with nutritional benchmarking helps identify decision rules and real-world constraints that interventions can target to support healthier food choices in rural settings.

**Keywords:** food choice, healthy eating perceptions, meal ideals, participatory co-design, food choice barriers, rural food environment, Colombia

---

## Study Overview

### Research Context

In rural Colombia, we explored how adults define "healthy eating," how they construct an "ideal day of eating," and what barriers influence their food decisions.

### Participants

**41 adults (18-70 years)** from three rural subregions of Antioquia, Colombia:
- **Medellín** (urban reference)
- **Guarne** (rural)
- **Santa Rosa de Osos** (rural)

### Methodology

**Participatory co-design workshops** with:
- Visual food models and portion cards
- Collaborative ideal meal construction
- Self-rating of diet-ideal alignment (1-5 scale)
- Group discussions on barriers and facilitators

**Nutritional benchmarking** against Colombian standards:
- **GABAS** (Guías Alimentarias Basadas en Alimentos) - Food-Based Dietary Guidelines
- **RIEN** (Recomendaciones de Ingesta de Energía y Nutrientes) - Recommended Nutrient Intakes

### Key Findings

| Finding | Description |
|---------|-------------|
| **"Fresh = Healthy"** | Participants consistently define healthy eating as "fresh" and "home-prepared" |
| **Nutrient Gaps** | Co-designed menus showed less vegetables and dairy than recommended |
| **Sodium Excess** | Ideal menus tended to exceed recommended sodium limits |
| **Intention-Action Gap** | Self-ratings at 2.5-3.5/5.0 indicate perceived gap between ideals and practice |
| **Real-World Barriers** | Cost, access, time, habits, and emotional strain — not lack of knowledge |

[Read the full paper (PDF)](Arcila_etat_2026.pdf)

---

## Quantitative Analysis

### Nutritional Benchmarking of Co-designed Menus

Comprehensive analysis comparing workshop meal patterns against Colombian dietary guidelines.

**Analysis Components:**
- **GABAS Analysis:** Food group servings vs. recommendations
- **RIEN Analysis:** Energy, macronutrients, and micronutrients adequacy
- **Visualizations:** Interactive graphs, heatmaps, and adequacy plots

**Resources:**

| Resource | Description |
|----------|-------------|
| [Interactive Report](Analysis_Quantitative/analysis.html) | Full Quarto analysis with integrated code |
| [R Scripts](Analysis_Quantitative/) | All analysis scripts (01-04) |
| [Graphs](Analysis_Quantitative/graphs/) | Publication-ready figures |
| [Datasets](Analysis_Quantitative/) | Processed data (GABAS & RIEN) |

**Quick Start:**

```r
# Run complete analysis
Rscript "01_GenDataSet.R"            # Generate datasets
Rscript "02_Gen_Graph_RIEN.R"        # RIEN graphs
Rscript "03_Gen_Graph_GABAS.R"       # GABAS graphs
Rscript "04_Gen_Graph_Nutrients.R"   # Nutrient heatmap
```

Or [view the interactive Quarto report](Analysis_Quantitative/analysis.html) for the complete analysis.

---

## Qualitative Analysis

### Thematic Analysis of Workshop Discussions

In-depth analysis of transcriptions to understand meanings, barriers, and decision-making processes.

**Key Themes:**

| Theme | Focus |
|-------|-------|
| **Meanings** | How participants define "healthy eating" |
| **Decision Rules** | Everyday heuristics guiding food choices |
| **Barriers** | Affordability, access, time, taste, emotions |
| **Gap Analysis** | Differences between ideals and practice |

**Available Materials:**
- Workshop transcriptions (restricted access)
- Coding framework and thematic categories
- Barrier mapping results
- Qualitative datasets

[View qualitative analysis directory](Analysis_Qualitative/)

---

## Participatory Workshops

### Visual Documentation & Methodology

**[Explore the complete workshop gallery](WORKSHOP.md)**

Interactive co-design workshops conducted across three municipalities with rich visual documentation.

**Workshop Activities:**
1. **Ideal Meal Construction** - Using visual food models and portion cards
2. **Menu Planning** - Building complete daily menu with group consensus
3. **Self-Assessment** - Rating diet-ideal alignment (1-5 scale)
4. **Barrier Mapping** - Discussing real-world constraints

**Workshop Materials:**

| Material | Access |
|----------|--------|
| [Participant Forms](Participatory_Workshop_Forms/) | PDF templates |
| [Photo Gallery](Participatory_Workshop_Evidence-Transcriptions/Pictures/) | Meal photos by region |
| [Transcriptions](Participatory_Workshop_Evidence-Transcriptions/Transcriptions/) | Restricted access |
| [Visual Guide](WORKSHOP.md) | Complete methodology |

---

## Open Data

### Available Resources

| Resource Type | Description | Location |
|---------------|-------------|----------|
| **Processed Datasets** | GABAS and RIEN calculations | [Analysis_Quantitative/](Analysis_Quantitative/) |
| **Food Group Data** | Servings from co-designed menus | `.rds` and `.xlsx` files |
| **Nutrient Estimates** | Adequacy calculations | Included in datasets |
| **R Scripts** | Complete analysis pipeline | `01_GenDataSet.R` through `04_*` |
| **Visual Data** | Workshop photos | [Pictures/](Participatory_Workshop_Evidence-Transcriptions/Pictures/) |
| **Forms & Templates** | Workshop materials | [Forms/](Participatory_Workshop_Forms/) |

### Reproducibility

All analyses are **fully reproducible**. Follow these guides:
- [QUICKSTART.md](QUICKSTART.md) - Step-by-step setup instructions
- [CONTRIBUTING.md](CONTRIBUTING.md) - How to contribute
- [DEPLOYMENT.md](DEPLOYMENT.md) - Deploy your own version

### Data Access

Most data is **openly available** in this repository. Some materials (transcriptions) have restricted access to protect participant privacy.

---

## How to Cite

### Paper Citation

**APA:**
```
Arcila-Agudelo, A.M., Cardona-Trujillo, H., Herazo-Castelblanco, A.S., 
Mejía-Gil, M.C., Muñoz-Mora, J.C., & Ortiz-Pradilla, T. (2026). 
"Healthy is fresh": A participatory study of meal ideals and barriers 
shaping food choice in rural Colombia. Food Policy, 199, 102756.
```

**BibTeX:**
```bibtex
@article{arcila2026healthy,
  title     = {"Healthy is fresh": A participatory study of meal ideals 
               and barriers shaping food choice in rural Colombia},
  author    = {Arcila-Agudelo, Ana Mar{\'i}a and Cardona-Trujillo, Harold 
               and Herazo-Castelblanco, Ana Sofia and Mej{\'i}a-Gil, 
               Mar{\'i}a Claudia and Mu{\~n}oz-Mora, Juan Carlos and 
               Ortiz-Pradilla, Tatiana},
  journal   = {Food Policy},
  volume    = {199},
  pages     = {102756},
  year      = {2026},
  doi       = {10.1016/j.foodpol.2026.102756}
}
```

### Repository Citation

Use GitHub's "Cite this repository" feature in the sidebar, or:

```
Arcila-Agudelo, A.M. et al. (2026). food-perception-rural-colombia: 
Online supplementary materials [Data and code]. GitHub. 
https://github.com/jcmunozmora/food-perception-rural-colombia
```

See [CITATION.cff](CITATION.cff) for structured metadata.

---

## Contact & Support

### Corresponding Author

**Ana María Arcila-Agudelo**  
Email: [ana.arcila@uniremington.edu.co](mailto:ana.arcila@uniremington.edu.co)  
Corporación Universitaria Remington

### Questions & Collaboration

- **Data Access:** Email corresponding author
- **Methods & Analysis:** See [CONTRIBUTING.md](CONTRIBUTING.md)
- **Technical Issues:** [Open an issue on GitHub](https://github.com/jcmunozmora/food-perception-rural-colombia/issues)

### Links

- [Full Paper (PDF)](Arcila_etat_2026.pdf)
- [GitHub Repository](https://github.com/jcmunozmora/food-perception-rural-colombia)
- [Complete Author Info](AUTHORS.md)

---

## 📄 License

This work is licensed under a [Creative Commons Attribution 4.0 International License](http://creativecommons.org/licenses/by/4.0/).

You are free to:
- **Share** — copy and redistribute the material
- **Adapt** — remix, transform, and build upon the material

Under the following terms:
- **Attribution** — You must give appropriate credit
