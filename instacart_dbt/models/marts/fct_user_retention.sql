select 
    user_id,
    total_orders,
    avg_days_between_orders,

    CASE
        when total_orders = 1 then 'One-Time'
        when total_orders between 2 and 5 then 'Occasional'
        when total_orders between 6 and 15 then 'Frequent'
        else 'Power User'
    end as customer_segment
from {{ ref('int_user_order_history') }}