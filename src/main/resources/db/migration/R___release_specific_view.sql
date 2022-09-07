CALL execute_on_production_databases_with_citus($cmd$
DO
$$
    BEGIN
        IF '${environment}' = 'release' THEN
            CREATE VIEW  dzone_examples_views.release_env_view AS SELECT * FROM dzone_examples.table_shared_citus ORDER BY user_id;
        ELSE
            CREATE VIEW  dzone_examples_views.other_env_view AS SELECT * FROM dzone_examples.table_shared_citus ORDER BY user_id;
        END IF;
    END;
$$;
$cmd$);
