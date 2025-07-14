# 📉 Customer Retention and Churn Analysis

This project focuses on analyzing customer churn behavior for a subscription-based digital platform. The goal is to uncover insights that can help reduce churn and improve customer retention through data-driven strategies.

---

## 📌 Objective

To identify key drivers of customer churn, segment user behavior, and create actionable insights using **Python (Pandas)**, **SQL**, and **Tableau**.

---

## 🛠️ Tools & Technologies

- Python (Pandas, NumPy, Seaborn, Matplotlib)
- MySQL
- Tableau (Interactive Dashboards)
- Jupyter Notebook

---

## 📊 Key Analyses Performed

- Data Cleaning & Preprocessing
- Retention Rate Calculation
- Churn Rate by User Segments and Subscription Type
- Customer Segmentation by Engagement & Revenue
- Monthly Charges Distribution (Churned vs Retained)
- SQL-based Churn Metric Validation
- Tableau Dashboards for Executive-Level Insight
- Predictive Model to classify churners

---

## 📈 Tableau Dashboards

Two Tableau dashboards were created for visual storytelling:

### 1️⃣ Customer Profile & Preferences Overview
- Churn Rate by Subscription Type, Payment Method, Paperless Billing
- User Preferences: Genre, Watchlist Size, User Rating
- Filters for Subscription Type and Genre

### 2️⃣ Behavior & Support Insights
- Churn Rate vs. Viewing Hours, Downloads, and Average Viewing Duration
- Impact of Multi-Device Access and Parental Control
- Support Tickets and Their Role in Churn

> 📍 Tableau workbook is included in the `tableau/` folder.

---

## 📊 Key Results & Insights

- **Overall churn rate**: **18.0%**
- **Churn rate for Premium Plan users**: **36.4%**
- Users with **Watchlist Size < 5** had a **churn rate of 45.1%**,  
  while those with ≥15 had just **11.7% churn**
- **Users raising >3 support tickets/month** → **62.3% churn**
- **Average Monthly Charges**:  
  - Churned users → **₹96.7**  
  - Retained users → **₹148.3**

---

## 🤖 Classification Model Performance (Logistic Regression)

| Metric         | Class 0 (Retained) | Class 1 (Churned) |
|----------------|--------------------|--------------------|
| Precision      | 0.87               | 0.64               |
| Recall         | 0.96               | 0.33               |
| F1-score       | 0.91               | 0.44               |
| Support        | 100                | 21                 |

- **Overall Accuracy**: **85%**
- **Macro Avg F1-score**: **0.68**
- **Weighted Avg F1-score**: **0.83**

---

## 📁 Repository Contents

| File / Folder         | Description                                 |
|-----------------------|---------------------------------------------|
| `analysis.ipynb`      | Main Jupyter Notebook with Pandas analysis  |
| `churn_queries.sql`   | SQL scripts used for churn segmentation     |
| `Cleaned_data/`       | Final cleaned dataset                       |
| `Original_data/`      | Raw input data                              |
| `tableau/`            | Tableau workbook and dashboards             |

---

## 📅 Project Status

- ✅ Data Cleaning & Pandas Analysis — *Complete*  
- ✅ SQL Querying & Validation — *Complete*  
- ✅ Tableau Dashboards — *Completed & Added*  
- ✅ Churn Prediction Modeling — *Complete*

---

## 🔗 How to Use

1. Clone the repository.
2. Open `analysis.ipynb` in Jupyter Notebook to explore Pandas analysis.
3. Use `churn_queries.sql` to run churn analysis in any MySQL interface.
4. Open the Tableau workbook from the `tableau/` folder for interactive dashboards.

---



