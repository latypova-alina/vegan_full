/*
This is the functions.sql file used by Squirm-Rails. Define your Postgres stored
procedures in this file and they will be loaded at the end of any calls to the
db:schema:load Rake task.
*/


CREATE FUNCTION sort_category (int) RETURNS SETOF int AS '
  select id from foods where category_id = $1;
' LANGUAGE sql;

CREATE FUNCTION category_before_del () RETURNS trigger AS '
BEGIN
if (select count(*) from foods where foods.category_id = OLD.id) > 0
THEN delete from foods where category_id = OLD.id;
end if;
return OLD;
END;
' LANGUAGE  plpgsql;

CREATE TRIGGER trigger_category_del_before
BEFORE DELETE ON categories FOR EACH ROW
EXECUTE PROCEDURE category_before_del();

