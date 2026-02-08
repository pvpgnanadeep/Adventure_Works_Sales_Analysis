/*ProductName & CustomerName*/
select s.*, 
p.EnglishProductName as ProductName ,
concat(c.firstname, " " ,c.middlename," " ,c.lastname) As CustomerFullName 
from sales as s join product as p
 on s.ProductKey = p.ProductKey 
 join customer as c 
 on s.CustomerKey=c.CustomerKey;
 
/*A.Year*/
select year(orderdate) as year,concat(truncate(sum(SalesAmount)/1000,1), "K")   as sales from sales 
group by year
order by year;

/*B.Monthno*/
select month(orderdate) as MonthNumber , concat(truncate(sum(SalesAmount)/1000,1), "K")   as sales from sales
group by MonthNumber
order by monthnumber;


/*C.Monthfullname*/
select monthname(orderdate) as MonthName,concat(truncate(sum(SalesAmount)/1000,1), "K")   as sales from sales
group by MonthName
order by MonthName desc;

/*D.Quarter(Q1,Q2,Q3,Q4)*/
select quarter(orderdate) as quarter, concat(truncate(sum(SalesAmount)/1000,1), "K") as sales  from sales
group by quarter
order by quarter;

/*E. YearMonth ( YYYY-MMM)*/
select concat( year(orderdate), " " ,monthname(orderdate) ) as YearMonth, concat(truncate(sum(SalesAmount)/1000,1), "K")  as sales from sales
group by YearMonth
order by YearMonth;

/*F. Weekdayno*/
select weekday(orderdate) as WeekdayNo,concat(truncate(sum(SalesAmount)/1000,1), "K") as sales from sales
group by WeekdayNo
order by weekdayNo;

/*G.Weekdayname*/
select dayname(orderdate) as WeekName, concat(truncate(sum(SalesAmount)/1000,1), "K") as sales from sales
group by WeekName
order by WeekName;

/*H.FinancialMOnth*/
select if(month(orderdate) >= 4, month(orderdate) - 3, month(orderdate) + 9) as FinancialMonth ,concat(truncate(sum(SalesAmount)/1000,1), "K") as sales
   from sales
   group by FinancialMonth
   order by FinancialMonth;
   
/*I. Financial Quarter */
select if(month(orderdate) BETWEEN 4 AND 6, 'Quarter1',
	if(month(orderdate) BETWEEN 7 AND 9, 'Quarter2',
	if(month(orderdate) BETWEEN 10 AND 12, 'Quarter3', 'Quarter4')
     )
  ) as FinancialQuarter,concat(truncate(sum(SalesAmount)/1000,1), "K") as sales
from sales 
group by FinancialQuarter
order by FinancialQuarter;

/*Sales*/
select  p.EnglishProductName as productname,(UnitPrice * OrderQuantity) * (1-UnitPriceDiscountPct) as SalesAmount from sales
 as s join product as p 
on s.ProductKey=p.ProductKey
order by salesamount;

/*ProductionCost*/
select  p.EnglishProductName as productname,(s.ProductStandardCost*s.OrderQuantity) As ProductionCost from sales s join product as p 
on s.ProductKey=p.ProductKey
order by salesamount;

/*Profit*/
select year(orderdate) as year ,sum(SalesAmount - (ProductStandardCost * OrderQuantity)) as Profit  from sales
group by year
order by year;

/*Top 5 Products*/
select p.EnglishProductName as product, s.SalesAmount as Total_Sales from product as p join sales as s
on p.ProductKey=s.ProductKey
order by SalesAmount desc
limit 5;
select * from viewsales;
drop view viewsales;

create view viewsales as
select s.salesordernumber, s.orderdate, p.englishproductname as productname, concat(c.firstname, ' ', c.middlename, ' ', c.lastname) as customerfullname,
    year(s.orderdate) as calendaryear,
    month(s.orderdate) as monthnumber,
    monthname(s.orderdate) as monthname,
    quarter(s.orderdate) as calendarquarter,
    concat(year(s.orderdate), ' ', monthname(s.orderdate)) as yearmonth,
	weekday(s.orderdate) as weekdayno,
    dayname(s.orderdate) as weekdayname,
    if(month(s.orderdate) >= 4, month(s.orderdate) - 3, month(s.orderdate) + 9) as financialmonth,
     if(month(s.orderdate) between 4 and 6, 'quarter1',
       if(month(s.orderdate) between 7 and 9, 'quarter2',
          if(month(s.orderdate) between 10 and 12, 'quarter3', 'quarter4')
       )
    ) as financialquarter,
    (s.unitprice * s.orderquantity) * (1 - s.unitpricediscountpct) as salesamount,
    (s.productstandardcost * s.orderquantity) as productioncost,
    ((s.unitprice * s.orderquantity) * (1 - s.unitpricediscountpct))
        - (s.productstandardcost * s.orderquantity) as profit
from sales s
join product p on s.productkey = p.productkey
join customer c on s.customerkey = c.customerkey;





 

 
 
 
 