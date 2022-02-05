# created_fields
The idea - Robust way of adding created and modified fields for data we add to database through db triggers

Update modified_by and modeified_on or modified_at for every db transaction.

Pick created_on and created_by or created_at from modified details whenever you insert a row into tables.

The sample trigger function for the above discussed is in the sql file with postgres db.

Change the syntax according to your db.
