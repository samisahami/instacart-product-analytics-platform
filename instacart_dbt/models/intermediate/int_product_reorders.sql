select 
    op.product_id,
    p.product_name,
    p.aisle_id,
    p.department_id,
    count(*) as total_ordered,
    sum(op.reordered) as total_reordered,
    round(sum(op.reordered) * 1.0 / count(*), 2) as reorder_rate
from {{ ref('stg_order_products') }} op
left join {{ ref('stg_products') }} p 
    on op.product_id = p.product_id
group by op.product_id, p.product_name, p.aisle_id, p.department_id