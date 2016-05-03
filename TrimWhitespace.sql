/* 	

	Author: Max Triba

	This stored procedure takes either a table name as an argument or defaults to all tables in the current database and runs 
	ltrim and rtrim functions on all fields. This procedure is useful to clean data that may have exported from systems that 
	pad fields with unnecessary whitespace.
	
*/

CREATE PROCEDURE [dbo].[trim_whitespace]

	@table	VARCHAR(50) = 'all'

AS
BEGIN

	DECLARE @i INT = 1
	DECLARE @sql VARCHAR(max)
	DECLARE @tempCol VARCHAR(max)
	DECLARE @tempTable table (
		row_num INT,
		colName VARCHAR(50)
		)
 
	INSERT INTO @tempTable SELECT ordinal_position, column_name 
	FROM 
			( SELECT b.* FROM information_schema.tables a
			INNER JOIN information_schema.columns b
			ON a.table_name = b.table_name
			WHERE a.table_type = 'BASE TABLE' 
			AND a.table_name = @table) info_schema ;

	 WHILE @i <= (SELECT COUNT(*) FROM @tempTable)
	 	BEGIN
	 
	 		SET @tempCol = (SELECT colName FROM @tempTable WHERE row_num = @i)
	 		SET @sql = 'UPDATE TABLE ' + @table + ' SET ' + @tempCol + ' = ltrim(rtrim(' + @tempCol + '))'
	 
	 		EXEC(@sql)
	 
	 	SET @i = @i + 1
	 
	 	END

END		

exec trim_whitespace