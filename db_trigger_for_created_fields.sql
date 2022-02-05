CREATE FUNCTION production.insert_created_fields()
    RETURNS trigger
    LANGUAGE 'plpgsql'
     NOT LEAKPROOF
AS $BODY$
BEGIN
   IF NEW.created_on IS NULL THEN  --Remove the condition of null if you want to update 
      NEW.created_on := NEW.modified_on;
   END IF;

   IF NEW.created_by IS NULL THEN  --Remove the condition of null if you want to update 
      NEW.created_by := NEW.modified_by;
   END IF;

   RETURN NEW;
END
$BODY$;


---------CREATE-TRIGGERS-FOR-TABLES-------------



CREATE TRIGGER created_fields
    BEFORE INSERT
    ON production.table_name
    FOR EACH ROW
    EXECUTE FUNCTION production.insert_created_fields();




CREATE TRIGGER created_fields
    BEFORE INSERT
    ON production.table_name2
    FOR EACH ROW
    EXECUTE FUNCTION production.insert_created_fields();