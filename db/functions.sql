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

CREATE FUNCTION add_default_image() RETURNS trigger AS '
BEGIN
IF NEW.image IS NULL or New.image = '''' THEN
    NEW.image = ''http://wpapers.ru/wallpapers/animals/Cats/11027/PREV_%D0%A3%D0%B4%D0%B8%D0%B2%D0%BB%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9-%D0%BA%D0%BE%D1%82.jpg'';
END IF;
return NEW;
END;
' LANGUAGE  plpgsql;

CREATE TRIGGER default_image
BEFORE INSERT ON recipes FOR EACH ROW
EXECUTE PROCEDURE add_default_image()



