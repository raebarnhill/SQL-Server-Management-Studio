SELECT * FROM tbl_habitat;

USE db_zoo

SELECT species_name FROM tbl_species WHERE species_order = 3;

SELECT * FROM tbl_nutrition;

SELECT nutrition_type FROM tbl_nutrition WHERE nutrition_cost <= 600.00;  

SELECT species_name FROM tbl_species WHERE species_nutrition BETWEEN 2202 AND 2206;

SELECT species_name AS 'Species Name:', nutrition_type AS 'Nutrition Type:'
FROM tbl_species, tbl_nutrition;


SELECT specialist_fname, specialist_lname, specialist_contact FROM tbl_specialist 
INNER JOIN tbl_care 
ON tbl_specialist.specialist_id = tbl_care.care_specialist
INNER JOIN tbl_species 
ON tbl_care.care_id = tbl_species.species_care
WHERE tbl_species.species_care LIKE '%6';



SELECT * FROM tbl_specialist
SELECT * FROM tbl_care
SELECT * FROM tbl_species