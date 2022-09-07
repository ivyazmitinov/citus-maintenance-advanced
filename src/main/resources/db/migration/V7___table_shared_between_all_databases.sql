CALL execute_on_production_databases($cmd$
    CREATE TABLE IF NOT EXISTS dzone_examples.table_shared_all (user_id TEXT, data jsonb)
$cmd$);