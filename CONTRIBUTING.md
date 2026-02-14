# Contributing Guide

Thank you for your interest in contributing to **"Healthy is fresh" - Rural Colombia Food Study**!

This document provides guidelines for different types of contributions.

---

## 🤝 Welcome Contributions

### 1. ✅ Report Errors or Bugs

If you find an error in code, documentation, or data:

1. **Verify** the error hasn't been previously reported in [Issues](https://github.com/jcmunozmora/food-perception-rural-colombia/issues)
2. **Open a new Issue** with:
   - Descriptive title (e.g., "Error in script 02: Unhandled NAs")
   - Clear problem description
   - Steps to reproduce the error
   - Expected vs. actual output
   - System information (R version, OS)

**Example:**
```
Title: Error in 04_Gen_Graph_Nutrients.R calculating % Calcium

Description: Script fails with error "object 'Calcio_EAR' not found" 
at line 45.

To reproduce:
1. Run setup.R
2. Run 01_GenDataSet.R
3. Run 04_Gen_Graph_Nutrients.R
4. Error appears at line 45

System: R 4.3.0, macOS Ventura 13.4
```

---

### 2. 📝 Improve Documentation

Found confusing or missing parts in documentation?

**Welcome areas:**
- Clarify instructions in READMEs
- Add usage examples
- Fix typos
- Translate documentation to other languages
- Improve code comments

**Process:**
1. Fork the repository
2. Create branch: `git checkout -b docs/improvement-description`
3. Make changes
4. Commit: `git commit -m "docs: clarify package installation"`
5. Push: `git push origin docs/improvement-description`
6. Open a Pull Request

---

### 3. 🐛 Fix Bugs

If you find and know how to fix a bug:

**Process:**
1. Open an Issue describing the bug (if it doesn't exist)
2. Fork the repository
3. Create branch: `git checkout -b fix/bug-name`
4. Fix the bug
5. Add comments explaining the fix
6. Commit: `git commit -m "fix: handle NAs in adequacy calculation"`
7. Open Pull Request referencing the Issue

---

### 4. ✨ Add New Features

Have ideas to extend the analyses?

**Before starting:**
1. Open an Issue describing the proposed feature
2. Wait for team feedback
3. Discuss technical approach

**Welcome features:**
- New visualizations
- Complementary statistical analyses
- Data validation scripts
- Auxiliary tools

**Process:**
1. Fork and create branch: `git checkout -b feature/feature-name`
2. Implement the feature
3. Document the code (inline comments + README)
4. Add usage examples
5. Commit: `git commit -m "feat: add variance analysis by region"`
6. Open Pull Request with detailed description

---

### 5. 📊 Share Adaptations

Have you adapted materials for another context?

**Valuable contributions:**
- Forms translated to other languages
- Adaptations for urban contexts
- Scripts modified for other composition tables
- Materials adapted for other age groups

**Process:**
1. Clearly document adaptations
2. Include usage context
3. Open Pull Request or Issue sharing the work
4. Team will evaluate whether to incorporate into main repository or link as external resource

---

## 📋 Code Standards

### R Scripts

#### Style
- **Indentation:** 2 spaces
- **Variable names:** snake_case (`my_variable`)
- **Function names:** snake_case (`calculate_adequacy()`)
- **Comments:** In English, clear and concise

#### Script structure
```r
# ============================================================================
# SCRIPT TITLE
# ============================================================================
# Description: Brief purpose description
# Input: Required input files
# Output: Generated files
# Author: [Name]
# Date: [Date]
# ============================================================================

# Load required libraries
library(tidyverse)
library(...)

# Clean environment (if applicable)
rm(list = ls())

# ============================================================================
# SECTION 1: DESCRIPTION
# ============================================================================

# Code with inline comments when necessary
result <- function(data)

# ...

# ============================================================================
# SAVE RESULTS
# ============================================================================

write_rds(result, "output.rds")
```

#### Functions
```r
# Document parameters and return
calculate_adequacy <- function(value, reference) {
  # Calculates % adequacy relative to RIEN reference
  #
  # Args:
  #   value: Observed value (numeric)
  #   reference: RIEN reference value (numeric)
  #
  # Returns:
  #   Adequacy percentage (numeric)
  
  (value / reference) * 100
}
```

---

### Markdown (Documentation)

- **Titles:** Use clear hierarchy (`#`, `##`, `###`)
- **Lists:** Use bullets (`-`) or numbers (`1.`)
- **Code:** Use blocks with syntax highlighting
- **Links:** Use relative paths within repository
- **Emojis:** OK to improve readability, in moderation

---

## 🔍 Pull Request Review Process

### What we review:

1. **Functionality:** Does the code do what it promises?
2. **Clarity:** Is it easy to understand?
3. **Documentation:** Is it well documented?
4. **Compatibility:** Is it compatible with the rest of the code?
5. **Style:** Does it follow project standards?

### Response times:

- First review: ~1 week
- Iterative feedback: ~3-5 days between rounds
- Merge: when approved by 2 reviewers

---

## 🚫 What NOT to Contribute

### Unaccepted changes:

- ❌ Identifiable participant data
- ❌ Complete unanonymized transcriptions
- ❌ Changes that break reproducibility of published analyses
- ❌ Undocumented code
- ❌ Massive cosmetic changes without functional value

---

## ⚖️ Ethical Considerations

### When contributing, you must:

- ✅ Respect privacy of original participants
- ✅ Not attempt to re-identify participants from anonymized data
- ✅ Appropriately cite original study
- ✅ Maintain CC BY 4.0 license in derived materials
- ✅ Declare conflicts of interest if any

---

## 📖 Useful Resources

### Learn Git and GitHub
- [GitHub Guides](https://guides.github.com/)
- [Pro Git Book](https://git-scm.com/book/en/v2)

### Learn R
- [R for Data Science](https://r4ds.had.co.nz/)
- [R Style Guide (Tidyverse)](https://style.tidyverse.org/)

### Learn Markdown
- [Markdown Guide](https://www.markdownguide.org/)

---

## 🙏 Acknowledgments

All contributors will be acknowledged in:
- GitHub "Contributors" section (automatic)
- Project main README
- Acknowledgments section in future publications (according to contribution magnitude)

---

## 📧 Questions

Have doubts about how to contribute?

- Open a [question Issue](https://github.com/jcmunozmora/food-perception-rural-colombia/issues/new)
- Write to: ana.arcila@uniremington.edu.co or jmunozm1@eafit.edu.co

---

## ✍️ Community Commitment

We commit to:
- 🤝 Being respectful and constructive in feedback
- ⏱️ Responding promptly to Issues and PRs
- 📚 Maintaining updated documentation
- 🌍 Fostering diversity of perspectives and contributors

---

**Thank you for helping improve this project!** 🎉

---

**Last updated:** February 2026
