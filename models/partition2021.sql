select * from {{ ref('join')}}
where date_part(year, order_date)=2021