CALL execute_on_production_databases($cmd$
    ALTER TABLE dzone_examples.table_shared_all ADD COLUMN "timestamp" timestamptz DEFAULT now();
$cmd$);