/*
This is the functions.sql file used by Squirm-Rails. Define your Postgres stored
procedures in this file and they will be loaded at the end of any calls to the
db:schema:load Rake task.
*/


CREATE FUNCTION sort_category (int) RETURNS SETOF int AS '
  select id from foods where category_id = $1;
' LANGUAGE sql;

