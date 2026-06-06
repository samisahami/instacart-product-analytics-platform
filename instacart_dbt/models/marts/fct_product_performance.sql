select 
    pr.product_id,
    pr.product_name,
    a.aisle,
    d.department,
    pr.total_ordered,
    pr.total_reordered,
    pr.reorder_rate
from {{ ref('int_product_reorders') }} pr
left join {{ ref('stg_aisles') }} a
    on pr.aisle_id = a.aisle_id
left join {{ ref('stg_departments') }} d
    on pr.department_id = d.department_id