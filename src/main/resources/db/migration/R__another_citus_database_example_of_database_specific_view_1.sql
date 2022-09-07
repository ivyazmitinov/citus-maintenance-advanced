SELECT DBLINK_EXEC('dbname=another_citus_database user=postgres', $remote$
START TRANSACTION;
CREATE MATERIALIZED VIEW dzone_examples_views.another_citus_database_specific_view
    AS SELECT * FROM dzone_examples.table_shared_citus LIMIT 10;
COMMIT;
$remote$)