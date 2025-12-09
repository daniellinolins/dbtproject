select 
    {{ retorna_campos() }} 
from {{ref("join")}}
where category_name = '{{var('category')}}'