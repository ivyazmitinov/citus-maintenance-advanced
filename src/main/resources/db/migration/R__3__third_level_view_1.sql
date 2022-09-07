-- 2022-01-01 forced run
CALL execute_on_production_databases_with_citus($cmd$
    DROP MATERIALIZED VIEW IF EXISTS dzone_examples_views.third_level_view CASCADE;
    CREATE MATERIALIZED VIEW dzone_examples_views.third_level_view AS
      SELECT * FROM dzone_examples_views.second_level_view UNION ALL
      SELECT * FROM dzone_examples.table_shared_citus;
$cmd$);