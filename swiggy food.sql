use online_food;

select count(id) from swiggy;

alter table swiggy add primary key(id);

select Restaurant, count(Restaurant)
from swiggy
group by Restaurant
having count(Restaurant) > 1;

select count(distinct(city)) from swiggy;

select city, count(distinct(restaurant)) as total_resto from swiggy
group by city
order by total_resto  desc;

select Restaurant, count(id) 
from swiggy
where city = 'bangalore'
group by Restaurant
order by count(id) desc;

select Restaurant, count(id) from swiggy
group by restaurant 
order by count(id) desc
limit 5;

use online_food;


/* Find top three restaurant names with maximum orders */
select * from (select restaurant, count(restaurant) as orders, dense_rank() over(order by count(restaurant) desc ) as ranks from  swiggy
group by restaurant) as sub_query
where ranks<4;

/*Find restaurants from Kormangala area of Bangalore who serve chinese food */
select restaurant, city, area from swiggy
where area = 'Koramangala' and food_type like '%chinese%';

/*Find average delivery time taken by swiggy */

select avg(delivery_time) from swiggy;

/*Find average delivery time taken by swiggy in each city */
select avg(delivery_time),city from swiggy
group by city;

/*Find all restaurants from Mumbai, Delhi and Kolkata who serve
/*North Indian and South Indian dishes */
select  city, food_type, restaurant from swiggy
where city in ('delhi','Bangalore')
and food_type like '%north indian%'
and food_type like '%south indian%';


select restaurant, count(restaurant) as orders, dense_rank() over(order by count(restaurant) desc ) as ranks from  swiggy
group by restaurant;








Select * from swiggy;

use online_food;



select count(distinct(restaurant)) from swiggy;

select count(restaurant) - count(distinct(restaurant)) as repeated_restro

from swiggy;