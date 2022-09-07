DO
$$
    DECLARE
        databases TEXT[];
        db        TEXT;
    BEGIN
        IF now() AT TIME ZONE 'UTC' <= '2100-01-01 UTC'::timestamptz THEN
            -- Temporary clause
            databases = ARRAY ['another_citus_database'];
        ELSE
            -- General clause
            databases = ARRAY ['new_citus_database', 'another_citus_database'];
        END IF;
        FOREACH db IN ARRAY databases
            LOOP
                PERFORM DBLINK_EXEC(FORMAT('dbname=%I user=postgres', db), $remote$
                START TRANSACTION;
                CREATE VIEW dzone_examples_views.timestamp_dependant_view AS
                    SELECT * FROM dzone_examples.table_shared_citus ORDER BY user_id, data DESC;
                COMMIT;$remote$);
            END LOOP;
    END;
$$;