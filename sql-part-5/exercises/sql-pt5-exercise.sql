-- 1. CREATE A TABLE
CREATE TABLE Sep2025JunkDB.shelbye_renfro.planned_makes(
Recipe_Id INT IDENTITY(1,1),
Recipe_Name VARCHAR (150),
RecipeType VARCHAR (150),
CookingTime INT,
)
-- 2. ADD 3 ROWS
INSERT INTO Sep2025JunkDB.shelbye_renfro.planned_makes (Recipe_Name,
RecipeType, CookingTime)
VALUES ('Pasta e Fagioli', 'Soup', 35),
('Chocolate Chip Scones', 'Dessert', 60),
('Fettucini Alfredo', 'Pasta', 20)

-- 3. UPDATE A ROW
UPDATE Sep2025JunkDB.shelbye_renfro.planned_makes
SET CookingTime = 45
WHERE Recipe_Id = 2;

--4. DELETE A ROW
DELETE FROM Sep2025JunkDB.shelbye_renfro.planned_makes
WHERE Recipe_Name = 'Fettucini Alfredo';

--5. DROP THE TABLE
DROP TABLE Sep2025JunkDB.shelbye_renfro.planned_makes;

