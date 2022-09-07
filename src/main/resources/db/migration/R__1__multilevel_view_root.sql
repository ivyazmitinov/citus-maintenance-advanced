CALL execute_on_production_databases_with_citus($cmd$
    DROP MATERIALIZED VIEW IF EXISTS dzone_examples_views.root_level_view CASCADE;
    CREATE MATERIALIZED VIEW dzone_examples_views.root_level_view AS SELECT * FROM dzone_examples.table_shared_citus;
$cmd$);