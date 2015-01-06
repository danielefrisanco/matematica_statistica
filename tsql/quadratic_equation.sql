
/*
IF OBJECT_ID (N'dbo.quadratic_equation', N'FN') IS NOT NULL
	DROP FUNCTION quadratic_equation;
GO*/
CREATE FUNCTION dbo.quadratic_equation (@a FLOAT
										,@b FLOAT
										,@c float  )
RETURNS   @ret TABLE
   (
    x1real     FLOAT,
    x1imm       FLOAT,
    x2real   FLOAT,
    x2imm   FLOAT
   )
AS
AS  
BEGIN 
	declare @delta float ;
	declare @denom float ;
	DECLARE @nat FLOAT;
				DECLARE @imm FLOAT;
	select @delta=(POWER(@b,2)-4*@a*@c);
	select @denom=(2*@a);
	if (@delta>=0)    
		BEGIN
			 
			SELECT 	@x12=((-@b+SQRT(@delta))/@denom);
			insert @ret
			SELECT 	CONVERT(varchar(100),@x12 )  
					,0
					,-CONVERT(varchar(100),@x12 ) 
					,0
			 
		END 
		ELSE 
			BEGIN  
				 
				 
				SELECT 	@nat=((-@b)/@denom);
				SELECT 	@imm=((SQRT(-@delta))/@denom);
				insert @ret
				SELECT 	CONVERT(varchar(100),@nat)
						,CONVERT(varchar(100),@imm ) 			
						,CONVERT(varchar(100),@nat)
						,-CONVERT(varchar(100),@imm )
				 
			end
	RETURN  

END
/*;
GO*/
 

SELECT * FROM dbo.quadratic_equation(1,2,1)  
SELECT * FROM  dbo.quadratic_equation(1,2,3)  
