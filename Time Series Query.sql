###### Time Series Query, M/M Query
##### Author: Max Triba
##### Date: March, 2015

# Actual unit names obsfucated, this is a recent script chosen to give a brief overview of my SQL abilities.

####################
######## Production: 

# Individual 

SELECT `Range`, Name, Alignment, AdjTotalUtilizationUNIT1_PC, AdjTotalUtilizationUNIT2_PC, AdjTotalUtilizationUNIT3_PC FROM
	(SELECT		
				CONCAT('From ', MONTHNAME(old.Date), ' to ', MONTHNAME(new.Date), ', ', YEAR(new.Date)) AS `Range`,
				month(new.Date) As CurrentMonth,
				new.Name,
				new.Alignment,
				FORMAT((new.AdjTotalUtilizationUNIT1 - old.AdjTotalUtilizationUNIT1)/old.AdjTotalUtilizationUNIT1, 2) AS AdjTotalUtilizationUNIT1_PC,
				FORMAT((new.AdjTotalUtilizationUNIT2 - old.AdjTotalUtilizationUNIT2)/old.AdjTotalUtilizationUNIT2, 2) AS AdjTotalUtilizationUNIT2_PC,
				FORMAT((new.AdjTotalUtilizationUNIT3 - old.AdjTotalUtilizationUNIT3)/old.AdjTotalUtilizationUNIT3, 2) AS AdjTotalUtilizationUNIT3_PC

	FROM utilization_ind new
	LEFT JOIN utilization_ind old ON
		(
			old.Date = DATE_SUB(new.Date, INTERVAL 1 MONTH) AND old.Name = new.Name
		)) A
WHERE CurrentMonth = 2 AND `Range` IS NOT NULL
ORDER BY field(Alignment, "UNIT1", "UNIT2", "UNIT3", "");


# Company-wide

SELECT `Range`, BusinessUnit, AdjTotalUtilizationUNIT1_PC, AdjTotalUtilizationUNIT2_PC, AdjTotalUtilizationUNIT3_PC FROM
	(SELECT		
				CONCAT('From ', MONTHNAME(old.Date), ' to ', MONTHNAME(new.Date), ', ', YEAR(new.Date)) AS `Range`,
				month(new.Date) As CurrentMonth,
				new.BusinessUnit,
				FORMAT((new.AdjTotalUtilizationUNIT1 - old.AdjTotalUtilizationUNIT1)/old.AdjTotalUtilizationUNIT1, 2) AS AdjTotalUtilizationUNIT1_PC,
				FORMAT((new.AdjTotalUtilizationUNIT2 - old.AdjTotalUtilizationUNIT2)/old.AdjTotalUtilizationUNIT2, 2) AS AdjTotalUtilizationUNIT2_PC,
				FORMAT((new.AdjTotalUtilizationUNIT3 - old.AdjTotalUtilizationUNIT3)/old.AdjTotalUtilizationUNIT3, 2) AS AdjTotalUtilizationUNIT3_PC

	FROM utilization_alltrivista new
	LEFT JOIN utilization_alltrivista old ON
		(
			old.Date = DATE_SUB(new.Date, INTERVAL 1 MONTH) AND old.BusinessUnit = new.BusinessUnit
		)) A
WHERE CurrentMonth = 2 AND `Range` IS NOT NULL
ORDER BY field(BusinessUnit, "UNIT1", "UNIT2", "UNIT3", "");










