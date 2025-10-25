
-- Sales

SELECT
	CAST(OrderDate AS DATE) AS OrderDate,
    SalesOrderNumber as OrderNumber,
    SalesOrderLineNumber as OrderLineItem,
    CustomerKey,
    ProductKey,
    SalesAmount,
    UnitPrice,
    TotalProductCost,
    (SalesAmount - TotalProductCost) AS Profit
FROM dbo.FactInternetSales
WHERE 
    OrderDateKey >= 20110101 AND OrderDateKey <= 20131231 AND ProductKey > 209;


--------------------------------------------------------------------------

-- Product Info

SELECT
    ProductKey,
    EnglishProductName AS ProductName,
    ProductSubcategoryKey,
    Color,
	Size AS ProductSize,
	StandardCost AS ProductCost,
    ListPrice AS ProductPrice
FROM dbo.DimProduct
WHERE 
	  StandardCost IS NOT NULL
  AND ListPrice IS NOT NULL
  AND ProductSubcategoryKey IS NOT NULL
  And Size IS NOT NULL;


------------------------------------------------------------------------------

-- Customer Info

SELECT
    CustomerKey,
    FirstName,
    LastName,
	(FirstName + ' ' + LastName) AS FullName,
    Gender,
	EnglishOccupation as Occupation,
	YearlyIncome,
    MaritalStatus,
    GeographyKey
FROM dbo.DimCustomer;


------------------------------------------------------------------------------

-- Product Category


SELECT 
	ProductCategoryKey,
	EnglishProductCategoryName as CategoryName
FROM DimProductCategory;


------------------------------------------------------------------------------

-- product Subcategory


SELECT
	ProductSubcategoryKey,
	EnglishProductSubcategoryName AS SubCategoryName,
	ProductCategoryKey
FROM DimProductSubcategory;


------------------------------------------------------------------------------

-- Date

SELECT
    FullDateAlternateKey AS Date,
    CalendarYear,
    CalendarQuarter,
    MonthNumberOfYear,
    EnglishMonthName AS MonthName,
    DayNumberOfMonth,
    DayNumberOfWeek,
    EnglishDayNameOfWeek AS DayName
FROM dbo.DimDate
WHERE 
    DateKey >= 20110101 AND DateKey <= 20131231;


------------------------------------------------------------------------------

-- Geography

SELECT
    GeographyKey,
    City,
    StateProvinceName AS State,
    EnglishCountryRegionName AS Country
FROM dbo.DimGeography;


------------------------------------------------------------------------------