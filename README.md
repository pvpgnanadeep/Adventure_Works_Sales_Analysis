Adventure Works Sales Analysis
📊 Project Overview

This project is an end-to-end sales analytics and business intelligence solution built using the Adventure Works dataset. It focuses on analyzing sales performance, profitability, production cost, customer behavior, and product trends using MySQL, Tableau, and Power BI.

The project demonstrates data cleaning, data modeling, relationship creation, and interactive dashboard development for business decision-making.

🧹 Data Cleaning & Preparation

Data preparation was performed before visualization to ensure accuracy and consistency:

Removed duplicate and null records

Standardized date formats and numeric fields

Cleaned inconsistent product and category names

Validated sales, cost, and profit calculations

Ensured data integrity across fact and dimension tables

🔗 Data Modeling & Relationships

Relationships were created using a star schema approach:

Fact tables connected to dimension tables using primary and foreign keys

Relationships built between:

Sales ↔ Customers

Sales ↔ Products

Sales ↔ Dates

Products ↔ Categories

Optimized relationships for accurate aggregations and filtering in dashboards

🗄 Database Layer (MySQL)

SQL used for:

Data extraction and transformation

Creating joins and relationships

Aggregations for sales, profit, and orders

Preparing clean datasets for BI tools

📈 Visualization & Dashboards
Tableau Dashboard

Interactive KPIs: Sales, Profit, Cost, Orders, Customers, Products

Year-wise sales and profit trends

Sales vs production cost comparison

Top products by sales performance

Dynamic filters for date, region, category, and product

Power BI Dashboard

Business performance overview with key metrics

Trend analysis across multiple years

Product and customer insights

Interactive slicers for flexible analysis

🛠 Tools & Technologies

MySQL

Tableau

Power BI

Adventure Works Sample Dataset

🎯 Project Objective

To demonstrate:

Data cleaning and transformation

Relational data modeling

Business intelligence dashboard development

Data-driven storytelling for decision support

📂 Repository Contents

MySQL.sql – SQL queries for data preparation and relationships

Tableau.twbx – Tableau interactive dashboard

PowerBIFinalDashboard.pbix – Power BI dashboard file# Adventure_Works_Sales_Analysis

End-to-end sales analysis project using the Adventure Works dataset. The repository includes data analysis and interactive dashboards built with Tableau, Power BI and MySQL to analyze sales, profit, production cost, customers, orders, and product performance. Designed for business insights and BI reporting.
