
create view gold.calendar AS
(
    select * from OPENROWSET(
        BULK 'https://st4adworks.dfs.core.windows.net/silver/AdventureWorks_Calendar/',
        FORMAT = 'parquet'
    )t
)

select * from gold.calendar

create view gold.customers AS
(
    select * from OPENROWSET(
        BULK 'https://st4adworks.dfs.core.windows.net/silver/AdventureWorks_Customers/',
        FORMAT = 'parquet'
    )t
)


create view gold.product_categories AS
(
    select * from OPENROWSET(
        BULK 'https://st4adworks.dfs.core.windows.net/silver/AdventureWorks_Product_Categories/',
        FORMAT = 'parquet'
    )t
)
go
create view gold.product_subcategories AS
(
    select * from OPENROWSET(
        BULK 'https://st4adworks.dfs.core.windows.net/silver/AdventureWorks_Product_Subcategories/',
        FORMAT = 'parquet'
    )t
)
go
create view gold.products AS
(
    select * from OPENROWSET(
        BULK 'https://st4adworks.dfs.core.windows.net/silver/AdventureWorks_Products/',
        FORMAT = 'parquet'
    )t
)
GO
create view gold.returns AS
(
    select * from OPENROWSET(
        BULK 'https://st4adworks.dfs.core.windows.net/silver/AdventureWorks_Returns/',
        FORMAT = 'parquet'
    )t
)
GO
create view gold.sales AS
(
    select * from OPENROWSET(
        BULK 'https://st4adworks.dfs.core.windows.net/silver/AdventureWorks_Sales/',
        FORMAT = 'parquet'
    )t
)
GO
create view gold.territories AS
(
    select * from OPENROWSET(
        BULK 'https://st4adworks.dfs.core.windows.net/silver/AdventureWorks_Territories/',
        FORMAT = 'parquet'
    )t
)

