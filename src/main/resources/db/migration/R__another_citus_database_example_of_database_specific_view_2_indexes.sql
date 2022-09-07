SELECT DBLINK_EXEC('dbname=another_citus_database user=postgres', $remote$
    START TRANSACTION;
    CREATE INDEX IF NOT EXISTS another_citus_database_specific_view_user_id_idx ON dzone_examples_views.another_citus_database_specific_view(user_id);
    COMMIT;
$remote$)