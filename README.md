# Sales Performance and Business Intelligence Dashboard

## **1. Project Overview**

This project delivers a comprehensive, interactive Business Intelligence (BI) dashboard aimed at **analyzing Sales Performance and Profitability** over a specific period. The process involved a structured BI lifecycle: starting with data extraction from a Star Schema data warehouse using T-SQL, followed by rigorous data cleaning, robust data modeling, and finally, the visualization of Key Performance Indicators (KPIs) to derive actionable business insights.

* **Analysis Period:** January 1st, 2011 to December 31st, 2013.

---

## **2. Tools and Technologies Used**

| Tool | Purpose in Project |
| :--- | :--- |
| **SQL Server / T-SQL** | Data Extraction, initial transformation (ETL), and rigorous data filtering. |
| **[Power BI / Tableau / Excel]** | Data Modeling, relationship management, dashboard design, and complex measure creation. |
| **[DAX / M Language]** | (Optional, depends on BI tool) Defining complex calculated measures and KPIs. |

---

## **3. Data Source and Extraction (SQL)**

Data was extracted from a relational database structured in a **Star Schema** to ensure efficient querying and modeling.

### **3.1. Database Schema Used**

The following tables were utilized in the extraction process:

* **Fact Table:**
    * `FactInternetSales` (**Sales**): Contains sales transactions, amounts, costs, and foreign keys.
* **Dimension Tables:**
    * `DimDate` (**Date**), `DimCustomer` (**Customer info**), `DimProduct` (**Product info**), `DimGeography` (**Geography**), `DimProductCategory` (**Product Category**), and `DimProductSubcategory` (**Product Subcategory**).

### **3.2. Extraction, Cleaning, and Transformation**

The provided SQL queries implemented strict data governance rules:

1.  **Temporal Filtering:** Sales and Date records were strictly filtered to the range `20110101` to `20131231`.
2.  **Product Data Quality:** Records in `DimProduct` were filtered to exclude any rows with `NULL` values in key financial and descriptive columns: `StandardCost`, `ListPrice`, `ProductSubcategoryKey`, and `Size`.
3.  **Sales Filtering:** Specific products were excluded from the analysis using the condition `ProductKey > 209`.
4.  **In-Query Calculations (Transformation):**
    * The **`Profit`** column was calculated directly during extraction: `(SalesAmount - TotalProductCost)`.
    * The **`FullName`** column was concatenated for customer ease-of-use: `(FirstName + ' ' + LastName)`.

---

## **4. Data Modeling and Relationships**

A robust **Star Schema** was implemented in the BI environment to ensure fast query performance and intuitive data slicing.

### **4.1. Key Relationships**

* The central `FactInternetSales` (Sales) table is linked to all dimension tables via **One-to-Many** relationships.
* The Product dimension hierarchy was established: **`Product Category` $\rightarrow$ `Product Subcategory` $\rightarrow$ `Product info`**.
* The Customer/Geography relationship links sales data to customer locations: `Customer info` (GeographyKey) $\rightarrow$ `Geography` (GeographyKey).

---

## **5. Key Performance Indicators (KPIs) and Metrics**

The dashboard is driven by the following calculated measures (KPIs) to facilitate business decision-making:

| KPI | Description | Analytical Purpose |
| :--- | :--- | :--- |
| **Total Revenue** | The gross value of all sales transactions. | Tracking overall business volume. |
| **Total Profit** | The net profit after deducting total product cost. | Primary indicator of financial health. |
| **Gross Margin % (GM%)** | The percentage of profit relative to revenue. | Efficiency and pricing strategy assessment. |
| **No. of Orders** | The total count of unique sales order numbers. | Measuring sales activity and volume. |
| **No. of Customer** | The total count of distinct customers. | Tracking customer base size. |
| **Average Order Value (AOV)** | The average revenue generated per order. | Evaluating customer purchasing behavior. |

### **5.1. Dashboard Insights**

The dashboard provides drill-down capabilities for various business perspectives:

* **Time-Series Analysis:** Monthly/Quarterly/Yearly trends for Revenue and Profit.
* **Product Performance:** Top N analysis by profit, broken down by Product Category and Subcategory.
* **Geographic Analysis:** Sales and Profit distribution across `Country` and `State/Province`.
* **Customer Segmentation:** Analysis of sales by `Occupation`, `MaritalStatus`, and `YearlyIncome` for targeted marketing strategies.

---

### **🖼️ Some of Dashboards**

**<img width="1200" height="646" alt="DashBoard 1" src="https://github.com/user-attachments/assets/a5e87d67-b9bc-42a3-bb02-831107bfee1d" />**

**<img width="1391" height="662" alt="DashBoard 2" src="https://github.com/user-attachments/assets/eb888835-d468-4b30-b6af-515fb5e276c7" />**
