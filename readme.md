# 📊 Customer Cohort Retention & Churn Analysis Dashboard

An executive-level Power BI dashboard built to analyze customer retention trends, acquisition volumes, and early-stage churn risk. This project forms part of my data analytics portfolio, demonstrating end-to-end capabilities from raw relational database querying to interactive data storytelling.

---

## 🚀 Project Overview
Understanding how long customers stay engaged after acquisition is vital for sustainable business growth. This project tracks monthly cohorts over a 12-month lifecycle to identify critical drop-off points, peak acquisition periods, and long-term customer loyalty baselines.

### Key Business Questions Addressed:
1. **What is our immediate M1 Churn risk?** (Quantifying the initial drop-off right after onboarding).
2. **Which acquisition months perform best?** (Tracking cohort size trends against long-term retention).
3. **Where do customers stabilize?** (Identifying true core retention baselines past Month 6 and Month 12).

---

## 🛠️ Tech Stack & Skills Demonstrated
* **Database & Querying:** MySQL (Relational data modeling, cohort transformation logic)
* **Data Processing:** Python (Pandas, NumPy for data validation and transformation)
* **Data Visualization & BI:** Power BI (Custom DAX measures, matrix heatmaps, gauge charts, and cross-filtering)
* **Design UI:** Custom dark-themed UI with a professional teal/blue gradient, high-accessibility white text layout, and transparent visual styling.

---

## 📈 Key Metrics & Custom DAX Measures
* **Total Acquired:** Total volume of new customers entering a cohort.
* **Total Engagements:** Aggregate count of active monthly instances across all tracked timelines.
* **M1 Churn %:** Calculated risk metric showing immediate customer drop-off (`1 - [Average M1 Retention]`).
* **Retention Heatmap Matrix:** Granular month-over-month decay tracking from Month 0 to Month 12.
