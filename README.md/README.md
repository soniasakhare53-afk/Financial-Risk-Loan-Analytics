# Financial Risk & Loan Default Analytics System

An end-to-end analytics project that simulates how banks and financial institutions assess **loan default risk** using **SQL for data modeling and querying** and **Python for risk scoring and visualization**.

This project demonstrates a complete workflow from database design to business insights and decision support.

---

## 📌 Problem Statement

Financial institutions need to identify **high-risk loan customers early** to reduce defaults and financial losses.  
This project analyzes customer demographics, loan details, repayment behavior, and credit scores to **quantify risk and segment customers** into actionable risk categories.

---

## 🧱 Database Design (MySQL)

A normalized, multi-table relational database was designed to reflect real-world banking systems.

### Tables:
- **customer** – customer demographics and income
- **loans** – loan details and loan types
- **repayments** – EMI payment history (paid / missed)
- **credit_scores** – customer credit history
- **defaults** – defaulted loan records
- **risk_scores** – derived risk scores and categories

Foreign key constraints ensure data integrity across all tables.

---

## 🔍 SQL Analytics

Advanced SQL queries were used to extract key risk indicators, including:

- Customers with missed EMIs
- Count of missed EMIs per customer
- Defaulted loans with customer profiles
- Default rate by loan type
- Credit score vs default status
- Loan-to-income ratio (repayment stress)
- Rule-based identification of high-risk customers

These queries help surface **early warning signals** of loan default.

---

## 🧠 Python Risk Scoring Engine

Python was used to build a **rule-based risk scoring system** that combines multiple financial risk factors:

### Risk Factors Used:
- Number of missed EMIs
- Credit score range
- Loan-to-income ratio
- Past default history

Each customer is assigned:
- a **numeric risk score**
- a **risk category**: `LOW`, `MEDIUM`, or `HIGH`

The results are written back to MySQL, completing a full **SQL → Python → SQL pipeline**.

---

## 📊 Dashboard-Style Visualizations

A dashboard-style analytical view was created in Jupyter Notebook using matplotlib and seaborn, including:

- Risk category distribution
- Credit score vs risk score relationship
- Loan-to-income ratio by risk category
- Top high-risk customers for intervention

These visuals enable **quick decision-making** for risk managers.

---

## 💡 Key Business Insights

- Customers with **missed EMIs** are strong early indicators of default risk.
- **Lower credit scores** correlate strongly with higher risk scores.
- High **loan-to-income ratios** indicate repayment stress.
- Certain loan types exhibit **higher default rates**.
- A small segment of customers contributes disproportionately to overall risk.

---

## ✅ Business Recommendations

- Monitor customers immediately after the **first missed EMI**.
- Apply **stricter underwriting** for customers with high loan-to-income ratios.
- Use **risk-based segmentation** to prioritize customer outreach.
- Regularly refresh risk scores to track changing customer behavior.

---

## 🛠 Tools & Technologies Used

- **SQL (MySQL)** – database design and analytics
- **PopSQL** – SQL development environment
- **Python** – analytics and risk scoring
- **pandas, numpy** – data processing
- **matplotlib, seaborn** – visualization
- **SQLAlchemy** – database integration

---

## 📈 Project Outcome

This project delivers a **bank-grade financial risk analytics system** that supports:
- early identification of risky customers
- data-driven credit risk decisions
- improved loan portfolio monitoring

---

## 👩‍💻 Author

**Sonia Sakhare**