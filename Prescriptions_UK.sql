---East Central London is City of London
SELECT * 
FROM prescriptions_uk.POSTCODE_AREAS pa 
ORDER BY POSTCODE_AREA 
WHERE POSTCODE_AREA = 'EC'
ORDER BY REGION 

---Top 3 most prescribed chemcials
SELECT cs2.CHEMICAL_NAME, count(*)
FROM PRESCRIPTIONS_UK.PRACTICE_ADDRESS pa 
JOIN PRESCRIPTIONS_UK.PRESCRIPTIONS p 
ON pa.SK_PRACTICE_ADDRESS = p.SK_PRACTICE_ADDRESS
JOIN PRESCRIPTIONS_UK.CHEMICAL_SUBSTANCES cs2
ON p.SK_CHEM_SUB = cs2.SK_CHEM_SUB 
WHERE postcode LIKE 'EC%'
GROUP BY cs2.CHEMICAL_NAME 
ORDER BY count(*) desc
LIMIT 3;

---Most prescribed chemical in the most prescribed year in east central london

WITH MOST_PRESCRIBED
AS 
(
SELECT p.SK_CHEM_SUB
FROM PRESCRIPTIONS_UK.PRACTICE_ADDRESS pa 
JOIN PRESCRIPTIONS_UK.PRESCRIPTIONS p 
ON pa.SK_PRACTICE_ADDRESS = p.SK_PRACTICE_ADDRESS
WHERE postcode LIKE 'EC%'
GROUP BY p.SK_CHEM_SUB
ORDER BY count(*) DESC
LIMIT 1
)



SELECT cs2.CHEMICAL_NAME, EXTRACT (YEAR FROM p.PERIOD_FIRST_DAY_AS_DATE) PRES_YEAR
FROM PRESCRIPTIONS_UK.PRACTICE_ADDRESS pa 
JOIN PRESCRIPTIONS_UK.PRESCRIPTIONS p 
ON pa.SK_PRACTICE_ADDRESS = p.SK_PRACTICE_ADDRESS
JOIN PRESCRIPTIONS_UK.CHEMICAL_SUBSTANCES cs2
ON p.SK_CHEM_SUB = cs2.SK_CHEM_SUB 
JOIN MOST_PRESCRIBED mp
ON cs2.SK_CHEM_SUB = mp.SK_CHEM_SUB
WHERE postcode LIKE 'EC%'
GROUP BY cs2.CHEMICAL_NAME, EXTRACT (YEAR FROM p.PERIOD_FIRST_DAY_AS_DATE)
ORDER BY count(*) desc
LIMIT 1;




SELECT EXTRACT (YEAR FROM p.PERIOD_FIRST_DAY_AS_DATE) , count(*)
FROM PRESCRIPTIONS_UK.PRACTICE_ADDRESS pa 
JOIN PRESCRIPTIONS_UK.PRESCRIPTIONS p 
ON pa.SK_PRACTICE_ADDRESS = p.SK_PRACTICE_ADDRESS
JOIN PRESCRIPTIONS_UK.CHEMICAL_SUBSTANCES cs2
ON p.SK_CHEM_SUB = cs2.SK_CHEM_SUB 
WHERE postcode LIKE 'EC%'
AND CHEMICAL_NAME = 'Other Appliances'
LIMIT 3;


SELECT *
FROM PRESCRIPTIONS_UK.PRACTICE_ADDRESS pa 
JOIN PRESCRIPTIONS_UK.PRESCRIPTIONS p 
ON pa.SK_PRACTICE_ADDRESS = p.SK_PRACTICE_ADDRESS
JOIN PRESCRIPTIONS_UK.CHEMICAL_SUBSTANCES cs2
ON p.SK_CHEM_SUB = cs2.SK_CHEM_SUB 
WHERE postcode LIKE 'EC%'
AND cs2.CHEMICAL_NAME = 'Colecalciferol'


GROUP BY 
ORDER BY count(*) desc

SELECT * FROM PRESCRIPTIONS_UK.PRESCRIPTIONS p 
LIMIT 100;

SELECT * FROM PRESCRIPTIONS_UK.CHEMICAL_SUBSTANCES cs2 LIMIT 100