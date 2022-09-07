CALL execute_on_production_databases($cmd$
    GRANT USAGE ON SCHEMA dzone_examples TO dzone_reader;
    GRANT USAGE ON SCHEMA dzone_examples_views TO dzone_reader;
    GRANT SELECT ON ALL TABLES IN SCHEMA dzone_examples TO dzone_reader;
    GRANT SELECT ON ALL TABLES IN SCHEMA dzone_examples_views TO dzone_reader;

    ALTER DEFAULT PRIVILEGES FOR USER postgres GRANT SELECT ON TABLES TO "dzone_reader";
$cmd$);