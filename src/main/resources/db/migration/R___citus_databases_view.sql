CALL execute_on_production_databases_with_citus($cmd$
    CREATE MATERIALIZED VIEW dzone_examples_views.citus_specific_view AS SELECT * FROM dzone_examples.table_shared_citus;
$cmd$);