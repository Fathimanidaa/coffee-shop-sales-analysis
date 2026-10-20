# ☕ Coffee Shop Sales Analysis Dashboard

An end-to-end coffee shop sales analysis project using **Microsoft Excel and MySQL** to explore sales performance, product popularity, store performance, and customer purchasing patterns.

## 📌 Project Overview

The objective of this project is to analyze coffee shop transaction data and transform raw sales records into meaningful business insights through SQL queries and an interactive dashboard.

The dashboard allows users to filter sales data by month and monitor key performance indicators (KPIs), daily sales trends, product categories, store locations, and sales patterns by day and hour.

This project demonstrates practical skills in data cleaning, SQL querying, business analysis, KPI tracking, and dashboard development.

## 🎯 Business Objectives

- Monitor total sales, orders, and quantity sold.
- Analyze daily sales trends and compare sales against the average.
- Identify the highest-performing product categories and product types.
- Compare sales performance across store locations.
- Understand weekday and weekend sales patterns.
- Explore sales distribution across different days of the week and hours of the day.
- Calculate month-over-month (MoM) sales performance metrics.

## 🛠️ Tools and Technologies

- **Microsoft Excel:** Interactive dashboard, KPI cards, charts, filtering, and data visualization.
- **MySQL:** Data preparation, aggregation, filtering, date/time functions, conditional logic, and window functions.
- **GitHub:** Project documentation and version-controlled portfolio presentation.

## 📊 Dashboard Preview

![Coffee Shop Sales Dashboard](https://github.com/Fathimanidaa/coffee-shop-sales-analysis/blob/main/coffee_shop_sales_%20analysis.png?raw=true)

*The dashboard includes monthly filtering, KPI cards, daily sales trends, product performance, store-level sales, and a day-and-hour sales heatmap.*

## 📁 Dataset Description

The dataset contains coffee shop transaction records with the following 11 columns:

| Column | Description |
|---|---|
| `transaction_id` | Unique identifier for a transaction record |
| `transaction_date` | Date of the transaction |
| `transaction_time` | Time of the transaction |
| `transaction_qty` | Quantity of products purchased |
| `store_id` | Identifier of the store |
| `store_location` | Location of the store |
| `product_id` | Identifier of the product |
| `unit_price` | Price per unit |
| `product_category` | Broad category of the product |
| `product_type` | Specific type of product |
| `product_detail` | Product name or description |

### Calculated Sales

Sales value is calculated using:

`Sales = unit_price × transaction_qty`

Total sales are calculated by summing the sales value across transaction records.

## 🧹 Data Preparation and SQL Analysis

The SQL preparation steps documented in this project include:

- Inspecting column data types using `DESCRIBE`.
- Converting transaction dates into the appropriate date format using `STR_TO_DATE()`.
- Converting transaction times into the appropriate time format.
- Altering the date and time columns to their respective data types.
- Renaming the transaction ID column to remove an encoding-related naming issue.

The analysis uses SQL concepts including:

- Aggregate functions: `SUM()`, `COUNT()`, `AVG()`, and `ROUND()`.
- Date and time functions: `MONTH()`, `DAY()`, `DAYOFWEEK()`, and `HOUR()`.
- Conditional logic: `CASE WHEN`.
- Grouping and sorting: `GROUP BY` and `ORDER BY`.
- Window functions: `LAG()` and `OVER()`.
- Subqueries for daily sales and average sales calculations.

## 📈 Key Performance Indicators

The dashboard displays the following main KPIs:

- **Total Sales:** Total revenue generated from product sales.
- **Total Orders:** Number of transaction records counted using `transaction_id`.
- **Total Quantity Sold:** Total quantity of products sold.
- **Month-over-Month Performance:** Sales difference and percentage change compared with the previous month.

## 🔍 Key Findings — January 2023

The following findings are based on the dashboard with **January 2023 selected**. Values are rounded as displayed.

### 1. Overall Sales Performance

| Metric | January 2023 |
|---|---:|
| Total sales | Approximately $82K |
| Total orders | 17,314 |
| Total quantity sold | 24,870 |
| Average daily sales | Approximately $2.635K |

The dashboard provides an overview of sales performance and shows how daily sales fluctuate throughout the month.

### 2. Weekday vs. Weekend Sales

| Day type | Sales | Share of total sales |
|---|---:|---:|
| Weekdays | Approximately $59K | 71.64% |
| Weekends | Approximately $23K | 28.36% |

**Insight:** Weekdays account for the larger share of sales in January. This suggests that weekday demand is an important contributor to overall revenue.

**Business implication:** The business could review staffing, inventory, and promotional schedules to support strong weekday demand while exploring ways to increase weekend sales.

### 3. Sales by Product Category

| Product category | Sales |
|---|---:|
| Coffee | $31.26K |
| Tea | $22.62K |
| Bakery | $9.54K |
| Drinking Chocolate | $8.34K |
| Coffee beans | $5.25K |
| Branded | $1.89K |
| Loose Tea | $1.29K |
| Flavours | $0.97K |

**Insights:**

- Coffee is the leading category, generating approximately $31.26K.
- Tea is the second-highest category, with approximately $22.62K.
- Coffee and tea together contribute approximately $53.88K in sales.
- Bakery and drinking chocolate also contribute to category-level revenue.

**Business implication:** The business could prioritize stock availability for popular coffee and tea products while evaluating opportunities to improve sales in smaller categories.

### 4. Sales by Product Type

| Product type | Sales |
|---|---:|
| Barista Espresso | $10.46K |
| Brewed Chai tea | $8.76K |
| Hot chocolate | $8.34K |
| Gourmet brewed coffee | $8.07K |
| Brewed Black tea | $5.54K |
| Brewed herbal tea | $5.44K |
| Organic brewed coffee | $4.61K |
| Premium brewed coffee | $4.53K |

**Insights:**

- Barista Espresso is the highest-selling product type among those shown, at approximately $10.46K.
- Brewed Chai tea and Hot chocolate are also strong contributors.
- Gourmet brewed coffee generates approximately $8.07K in sales.

**Business implication:** Popular product types could receive priority in inventory planning. Bundling complementary products and testing targeted promotions may also help increase sales.

### 5. Sales by Store Location

| Store location | Sales |
|---|---:|
| Hell's Kitchen | $27.82K |
| Astoria | $27.31K |
| Lower Manhattan | $26.54K |

**Insights:**

- Hell's Kitchen has the highest sales among the three locations displayed.
- Astoria follows closely, with approximately $27.31K.
- Lower Manhattan generates approximately $26.54K.
- The sales difference between these locations is relatively small.

**Business implication:** Store-level performance can be evaluated further using transaction volume, average order value, product mix, operating costs, and footfall to understand what drives differences in performance.

### 6. Daily Sales Trend

The daily sales chart compares total sales across the dates in January and displays an average daily sales reference of approximately $2.635K.

**Insights:**

- Daily sales fluctuate during the month.
- Several dates show sales above the displayed daily average.
- Comparing individual dates against the average helps identify stronger and weaker sales days.

**Business implication:** The business can investigate high-performing dates, recurring demand patterns, promotions, and inventory availability to improve daily planning.

### 7. Sales by Day of the Week

The day-and-hour visualization also provides an overview of sales by weekday.

Approximate totals shown in the dashboard:

| Day | Sales |
|---|---:|
| Monday | $13.2K |
| Tuesday | $13.7K |
| Wednesday | $10.4K |
| Thursday | $10.5K |
| Friday | $10.7K |
| Saturday | $10.4K |
| Sunday | $12.7K |

**Insights:**

- Tuesday has the highest displayed sales among the days shown.
- Monday also records relatively strong sales.
- Wednesday and Saturday show lower sales compared with Tuesday.

**Business implication:** Day-level trends can help guide staff scheduling, inventory preparation, and targeted promotions. These patterns should be checked across additional months before making long-term operational decisions.

### 8. Sales by Hour

The heatmap combines the day of the week with the hour of the day to show how sales vary across time periods.

**Analysis opportunities:**

- Identify hours with relatively high sales.
- Compare hourly demand across weekdays and weekends.
- Identify periods that may require more staff or inventory.
- Explore opportunities to promote products during lower-sales periods.

The heatmap supports time-based analysis; conclusions about the exact busiest hour should be confirmed using the underlying hourly values.

## 💡 Business Recommendations

Based on the displayed January results, the following actions could be explored:

1. **Maintain popular product availability:** Prioritize stock planning for coffee, tea, Barista Espresso, and Brewed Chai tea.
2. **Strengthen weekend sales:** Test weekend-specific offers or product bundles and measure their impact.
3. **Use store-level comparisons:** Investigate why Hell's Kitchen leads sales and whether successful practices can be applied elsewhere.
4. **Plan staffing using hourly demand:** Use the heatmap to support shift planning and reduce potential service delays.
5. **Monitor daily performance:** Compare daily sales with the average to identify unusual changes and investigate their causes.
6. **Track monthly performance:** Use MoM metrics to monitor sales changes and identify longer-term trends.

These recommendations are opportunities for further investigation, not proof of customer preferences or business causes.

## 📂 Project Structure

```text
coffee-shop-sales-analysis/
│
├── README.md
├── dashboard/
│   └── coffee_shop_sales_dashboard.png
├── sql/
│   └── coffee_shop_sales_queries.docx
├── presentation/
│   └── coffee_shop_sales_presentation.pptx
└── data/
    └── coffee_shop_sales.csv
```

*Update the filenames and folders to match the files actually uploaded to your repository. Include the dataset only if you have permission to share it.*

## 🚀 How to Explore the Project

1. Open the dashboard screenshot to review the visualizations.
2. Review the SQL query document to understand the data preparation and analysis.
3. Open the presentation for an overview of the project.
4. If the original Excel workbook is available, open it to interact with the monthly filter and dashboard visuals.

## 📌 Limitations and Further Improvements

- The findings documented here describe January 2023 and should not be generalized to every month.
- The displayed KPI values are rounded and should be verified against the underlying workbook for exact reporting.
- Sales revenue does not represent profit because operating costs and product costs are not included.
- Transaction counts may not equal the number of unique orders if multiple records belong to the same order.
- Further analysis could include average transaction value, product-level quantity analysis, store comparisons across months, and profit analysis if cost data becomes available.

## 🏁 Conclusion

This project demonstrates how transaction data can be transformed into useful business information through SQL analysis and an interactive sales dashboard.

By examining sales performance across time, products, and store locations, the project provides a foundation for data-driven decisions involving inventory planning, staffing, product performance, and sales improvement.

**Skills demonstrated:** SQL, data preparation, aggregation, window functions, KPI analysis, dashboard design, data visualization, and business insight communication.
