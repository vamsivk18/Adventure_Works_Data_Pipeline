create external table gold.fact_sales
WITH(
    LOCATION = 'fact_sales',
    DATA_SOURCE = AzureDataLakeGold,
    FILE_FORMAT = parquet_format
)
AS
select 
    s.OrderNumber as OrderNumber,
    s.orderdate as OrderDate,
    s.productKey as ProductKey,
    s.customerkey as CustomerKey,
    s.territorykey as TerritoryKey,
    s.orderquantity as OrderQuantity,
    p.productprice as ProductPrice,
    s.orderquantity*p.productcost as OrderCost,
    s.orderquantity*p.productprice as OrderRevenue
 from gold.sales as s
 left join gold.products p
on s.productkey = p.productkey 




create external table gold.dim_customers
WITH(
    LOCATION = 'dim_customers',
    DATA_SOURCE = AzureDataLakeGold,
    FILE_FORMAT = parquet_format
)
AS
select 
    c.customerkey as CustomerKey,
    c.name as Name,
    c.birthdate as BirthDate,
    c.gender as Gender,
    c.emailaddress as EmailAddress,
    c.occupation as Occupation,
    c.annualincome as AnnualIncome,
    c.educationlevel as EducationLevel,
    c.maritalstatus as MaritalStatus,
    c.totalchildren as TotalChildren,
    c.homeowner as HomeOwner
 from gold.customers as c


create external table gold.dim_products
WITH(
    LOCATION = 'dim_products',
    DATA_SOURCE = AzureDataLakeGold,
    FILE_FORMAT = parquet_format
)
AS
select 
    p.productKey as ProductKey,
    p.productName as Name,
    t.categoryName as Category,
    t.subcategoryname as SubCategory,
    p.productDescription as ProductDescription,
    p.productColor as ProductColor,
    p.productsize as ProductSize,
    p.productcost as CostPrice,
    p.productprice as SellingPrice
from gold.products p 
left join (
select ps.*,pc.categoryname from gold.product_subcategories ps
left join gold.product_categories pc
on ps.productcategorykey = pc.productcategorykey) as t
on p.productsubcategorykey = t.productsubcategorykey




create external table gold.dim_territories
WITH(
    LOCATION = 'dim_territories',
    DATA_SOURCE = AzureDataLakeGold,
    FILE_FORMAT = parquet_format
)
AS
select 
    t.salesterritorykey as SalesTerritoryKey,
    t.region as Region,
    t.country as Country,
    t.continent as Continent
 from gold.territories as t


create external table gold.dim_calendar
WITH(
    LOCATION = 'dim_calendar',
    DATA_SOURCE = AzureDataLakeGold,
    FILE_FORMAT = parquet_format
)
AS
select 
    *
 from gold.calendar


-- drop external table gold.dim_calendar;
-- drop external table gold.dim_customers;
-- drop external table gold.dim_products;
-- drop external table gold.dim_territories;
-- drop external table gold.fact_sales;














