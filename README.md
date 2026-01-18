

# Student Performance Analysis (SQL Server)

## Overview

This repository contains a set of **SQL Server (T-SQL) analytical queries** designed to explore student academic performance and its relationship with behavioral, demographic, and support-related factors.

The focus of this project is **query design, statistical reasoning in SQL, and clean, well-documented analysis** rather than visualization or dashboarding.

---

## Database Context

* **Database Engine:** Microsoft SQL Server
* **Primary Table:** `Students`
* **Granularity:** One row per student

The dataset includes academic outcomes (exam scores), behavioral indicators (attendance, study hours, sleep, physical activity), and contextual attributes (family income, school type, motivation level, internet access, etc.).

---

## Analytical Objectives

The SQL queries answer the following categories of questions:

1. Overall academic performance
2. Group-based comparisons (gender, school type, income, support factors)
3. Behavioral impact analysis
4. Statistical relationships (correlation analysis)

---

## Query Design Principles

* All averages are rounded to **3 decimal places** for readability
* Explicit `CAST()` is used to ensure numeric precision
* Pearson correlation is implemented **manually** due to lack of a built-in function in SQL Server
* Queries are modular, readable, and fully commented
* No temporary tables or procedural logic — pure analytical SQL

---

## Analysis Breakdown

### 1. Overall Performance

* Average exam score across all students
* Identifies the general performance baseline

### 2. Gender-Based Performance

* Average exam score grouped by gender
* Enables comparison of academic outcomes across genders

### 3. Study Effort vs Performance

* Pearson correlation between `Hours_Studied` and `Exam_Score`
* Measures strength and direction of the relationship

### 4. School Type Comparison

* Identifies whether public or private schools have higher average scores

### 5. Attendance Impact

* Attendance grouped into **Low, Medium, High** ranges
* Evaluates how attendance levels affect performance

### 6. Academic Support Factors

* Tutoring sessions vs exam scores
* Extracurricular activities vs exam scores

### 7. Family & Socioeconomic Context

* Parental education level vs performance
* Family income category vs performance

### 8. Learning Environment

* Internet access vs exam scores
* Motivation level vs exam scores

### 9. Accessibility & Inclusion

* Performance comparison between students **with and without learning disabilities**

### 10. Multi-Factor Correlation Analysis

* Correlation between `Exam_Score` and:

  * Hours_Studied
  * Sleep_Hours
  * Physical_Activity
* Identifies which behavioral factor has the strongest statistical relationship with performance

---

## Statistical Methodology (Correlation)

Because SQL Server does not support `CORR()` natively, Pearson correlation is calculated using the formula:

```
r = (AVG(XY) - AVG(X) * AVG(Y)) / (STDEV(X) * STDEV(Y))
```

This approach:

* Ensures transparency
* Avoids external tools
* Demonstrates applied statistical reasoning directly in SQL

---

## File Structure

```
├── sql/
│   └── student_performance_analysis.sql
└── README.md
```

---

## Intended Use

This project is suitable for:

* SQL portfolio demonstration
* Academic or postgraduate coursework
* Data analyst / BI role technical assessment
* Interview discussion on analytical SQL and statistics

---

## Author

**Emmanuel Anowai**
SQL • Data Analysis • Statistical Reasoning

---

