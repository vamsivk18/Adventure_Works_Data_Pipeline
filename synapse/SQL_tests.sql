select * from gold.sales s
left join gold.territories t
on s.territorykey = t.salesterritorykey

SELECT YEAR(orderdate) AS Year,count(*)
FROM gold.sales
group by YEAR(orderdate)
ORDER BY Year;

select * from gold.dim_products