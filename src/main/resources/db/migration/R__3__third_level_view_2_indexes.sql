-- 2022-01-01 forced run
CALL execute_on_production_databases_with_citus($cmd$
    CREATE INDEX IF NOT EXISTS third_level_view_user_id_idx ON dzone_examples_views.third_level_view(user_id);
$cmd$);