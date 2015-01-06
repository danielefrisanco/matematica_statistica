

IF OBJECT_ID (N'dbo.quadratic_equation', N'FN') IS NOT NULL
	DROP FUNCTION quadratic_equation;
GO
CREATE FUNCTION dbo.quadratic_equation (@a FLOAT
										,@b FLOAT
										,@c float  )
RETURNS varchar (100)
AS  
BEGIN

	DECLARE @ret  varchar(100);
	declare @delta float ;
	declare @denom float ;
	select @delta=(POWER(@b,2)-4*@a*@c);
	select @denom=(2*@a);
	if (@delta>=0)    
		BEGIN
			DECLARE @x12 FLOAT;
			SELECT @x12=((-@b+SQRT(@delta))/@denom);
			SELECT @ret='@x1='+ CONVERT(varchar(100),@x12 )  
						+' @x2='+ CONVERT(varchar(100),@x12 ) 
		END 
		ELSE 
			BEGIN  
				DECLARE @nat FLOAT;
				DECLARE @imm FLOAT;
				 
				SELECT @nat=((-@b)/@denom);
				SELECT @imm=((SQRT(-@delta))/@denom);
				SELECT @ret='@x1='+ CONVERT(varchar(100),@nat)+'+i'+CONVERT(varchar(100),@imm ) 
							+' @x2='+ CONVERT(varchar(100),@nat)+'-i'+CONVERT(varchar(100),@imm )
			end
	RETURN @ret ;

END;
GO


SELECT dbo.quadratic_equation(1,2,1)  
SELECT dbo.quadratic_equation(1,2,3)  
