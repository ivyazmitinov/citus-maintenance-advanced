CALL execute_on_production_databases_with_citus($cmd$
    DROP TABLE IF EXISTS dzone_examples_views.distributed_materialized_view CASCADE;
    CREATE TABLE dzone_examples_views.distributed_materialized_view
    (
        user_id TEXT,
        metric_1 INTEGER,
        metric_2 NUMERIC,
        metric_3 TEXT
    );
    CREATE PROCEDURE dzone_examples_views.distributed_materialized_view_refresh() LANGUAGE sql
    BEGIN ATOMIC
        DELETE FROM dzone_examples_views.distributed_materialized_view;
        INSERT INTO dzone_examples_views.distributed_materialized_view
        SELECT user_id, count(*) AS metric_1, max((data ->> 'some_field')::numeric) as metric_2, string_agg(data ->> 'anotherField', ',') AS metric_3
        FROM dzone_examples.table_shared_citus
        GROUP BY user_id;
    END;
    CALL dzone_examples_views.distributed_materialized_view_refresh();
$cmd$);