SELECT
    op.order_id,
    count(*) as total_items,
    count(distinct op.product_id) as unique_products,
    sum(op.reordered) as reordered_items,
    avg(op.add_to_cart_order) as avg_add_to_cart_position
from {{ ref('stg_order_products') }} op
group by op.order_id