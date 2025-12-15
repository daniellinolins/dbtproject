{{
    config(
        materialized='table',        
        pre_hook=['
            BEGIN; LOCK TABLE {{target.schema}}.bireport;
        '],     
        post_hook=['
            COMMIT;
            GRANT USAGE ON SCHEMA {{target.schema}} TO GROUP biusers;
            GRANT SELECT ON TABLE {{target.schema}}.bireport to group biusers;
        ']
    )
}}
select * from {{ref('join')}}