SELECT DBLINK_EXEC('dbname=new_citus_database user=postgres', $remote$
START TRANSACTION;
CREATE MATERIALIZED VIEW dzone_examples_views.new_citus_database_specific_view
    AS SELECT * FROM dzone_examples.table_shared_citus LIMIT 100;
COMMIT;
$remote$)