# "Healthy is fresh": Food Perception in Rural Colombia

## Online Supplementary Materials

[![Paper](https://img.shields.io/badge/Paper-PDF-red.svg)](Arcila_etat_2026.pdf)
[![License](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by/4.0/)

This repository contains the supplementary materials for the study:

**"Healthy is fresh": A participatory study of meal ideals and barriers shaping food choice in rural Colombia**

Ana María Arcila-Agudelo¹*, Harold Cardona-Trujillo², Ana Sofia Herazo-Castelblanco³, María Claudia Mejía-Gil⁴, Juan Carlos Muñoz-Mora⁵, Tatiana Ortiz-Pradilla⁶

¹ Corporación Universitaria Remington | ² ³ ⁵ Universidad EAFIT (Centro de Valor Público) | ⁴ ⁶ Universidad EAFIT (Mercadeo e Innovación)

*Corresponding author: ana.arcila@uniremington.edu.co

📄 [View complete author information](AUTHORS.md)

---

## 📋 Contents

- [Study Overview](#study-overview)
- [🎨 Participatory Workshops - Visual Documentation](#participatory-workshops)
- [Quantitative Analysis](#quantitative-analysis)
- [Qualitative Analysis](#qualitative-analysis)
- [Open Data](#open-data)
- [How to Cite](#how-to-cite)

---

## 🔬 Study Overview

In rural Colombia, we explored how adults define "healthy eating," how they construct an "ideal day of eating," and what barriers influence their food decisions.

**Participants:** 41 adults (18-70 years) from three rural subregions of Antioquia, Colombia.

**Methodology:** Participatory co-design workshops with visual food models, qualitative thematic analysis, and comparison with Colombian food-based dietary guidelines (GABAS) and recommended nutrient intakes (RIEN).

**Key Findings:**
- Participants define "healthy" as **"fresh"** and **"home-prepared"**
- Co-designed ideal menus showed less inclusion of vegetables and dairy than recommended
- Perceived gap between ideals and daily practice (2.5-3.5/5.0)
- Identified barriers: cost, limited access, time, entrenched habits, and emotional strain

---

## 🎨 Participatory Workshops

### 📖 [**VIEW COMPLETE VISUAL WORKSHOP DOCUMENTATION**](WORKSHOP.md)

Participatory co-design workshops are the methodological heart of this study. Through 9 sessions in 3 rural regions, 41 adults co-designed ideal menus and discussed barriers to healthy eating.

#### 🎯 Highlights:

- **Participatory methodology** with visual food models
- **Photographs of co-designed meals** by each group
- **Downloadable forms** to replicate the workshop
- **Step-by-step process** (8 phases in 2 hours)
- **Key findings** from participants' perspectives

#### 📥 Available Materials:

📁 **View materials:**
- [📄 Complete workshop documentation](WORKSHOP.md) - With photos and visual examples
- [📋 Workshop forms](Participatory_Workshop_Forms/)
  - Individual reflection templates
  - Co-designed meal registry
  - Alignment scales and barriers

- [🎨 Workshop design](Participatory_Workshops_Design/)
  - Facilitation protocol
  - Methodological guides

#### 📸 Visual Evidence:

📁 **View evidence:**
- [📸 Photos of co-designed meals](Participatory_Workshop_Evidence-Transcriptions/Pictures/)
  - Medellín (3 age groups)
  - Guarne (3 age groups)
  - Santa Rosa de Osos (3 age groups)

- [📝 Focus group transcriptions](Participatory_Workshop_Evidence-Transcriptions/Transcriptions/)
  - Verbatim transcriptions of discussions about barriers and facilitators

> **💡 New:** [Explore the complete visual workshop documentation](WORKSHOP.md) with photographs of real meals, step-by-step process, and findings analysis.

---

## 📊 Quantitative Analysis

Quantitative analysis compares co-designed menus with Colombian food-based dietary guidelines (GABAS) and recommended nutrient intakes (RIEN).

> **📖 Interactive Report:** View the complete analysis in the [Quarto Report](Analysis_Quantitative/analysis.html) - an integrated document with all scripts, visualizations, and findings.

### Analysis Flow

```
01_GenDataSet.R          → Generates GABAS and RIEN datasets
    ↓
02_Gen_Graph_RIEN.R      → Visualizes nutritional adequacy (RIEN)
03_Gen_Graph_GABAS.R     → Visualizes servings by food group (GABAS)
04_Gen_Graph_Nutrients.R → Heatmap of nutritional adequacy by age
```

### Scripts and Data

📁 **View analysis:**
- [Quantitative analysis scripts](Analysis_Quantitative/)
  - `01_GenDataSet.R` - Structured dataset generation
  - `02_Gen_Graph_RIEN.R` - Nutritional adequacy graphs
  - `03_Gen_Graph_GABAS.R` - Food group graphs
  - `04_Gen_Graph_Nutrients.R` - Nutritional heatmap by age

- [Generated graphs](Analysis_Quantitative/graphs/)

### Main Results

![Nutritional Adequacy](Analysis_Quantitative/panel_b_heatmap.pdf)

**Figure:** Nutritional adequacy (% RIEN) of co-designed ideal menus by age group. Menus achieved higher adequacy for fats and sodium, and lower adequacy for calcium and iron.

---

## 📝 Qualitative Analysis

Thematic analysis identified meanings, decision rules, and perceived barriers to healthy eating.

📁 **View analysis:**
- [Qualitative data](Analysis_Qualitative/)
  - Sociodemographic information
  - Barriers to healthy diet (coded)
  - Qualitative databases

### Main Themes

1. **"Healthy is fresh"** - Local heuristics for food decision-making
2. **Ideal-practice gap** - Perceived distance between intentions and daily consumption
3. **Structural barriers** - Cost, access, time
4. **Sensory and emotional barriers** - Taste preferences, anxiety, stress

---

## 📂 Open Data

De-identified data are available in this repository:

- ✅ Co-designed menus with estimated portions
- ✅ Processed datasets (GABAS and RIEN)
- ✅ Reproducible analysis scripts
- ✅ Workshop materials

⚠️ **Ethical note:** Complete transcriptions and audio recordings are not publicly available to protect participants' privacy in small rural communities. De-identified outputs available upon request and ethical approval.

---

## 📖 How to Cite

```bibtex
@article{arcila-agudelo2026healthy,
  title={"Healthy is fresh": A participatory study of meal ideals and barriers shaping food choice in rural Colombia},
  author={Arcila-Agudelo, Ana María and Cardona-Trujillo, Harold and Herazo-Castelblanco, Ana Sofia and Mejía-Gil, María Claudia and Muñoz-Mora, Juan Carlos and Ortiz-Pradilla, Tatiana},
  journal={[Journal Name]},
  year={2026},
  note={Online supplementary materials: https://github.com/jcmunozmora/food-perception-rural-colombia}
}
```

---

## 📧 Contact

For questions about supplementary materials or additional data requests, contact:

- **Corresponding author:** Ana María Arcila-Agudelo
- **Affiliation:** Corporación Universitaria Remington / Universidad EAFIT
- **Email:** ana.arcila@uniremington.edu.co
- **Alternative email:** jmunozm1@eafit.edu.co (Juan Carlos Muñoz-Mora)

---

## ⚖️ License

This work is licensed under a Creative Commons Attribution 4.0 International License (CC BY 4.0).

Data and materials may be reused with appropriate attribution.

---

## 🙏 Acknowledgments

This study was conducted in collaboration with:
- Universidad EAFIT
- Food and Agriculture Organization of the United Nations (FAO)
- Local community organizations in Antioquia, Colombia

We thank all participants from rural communities who shared their experiences and knowledge in the participatory workshops.

---

**Last updated:** February 2026
