PROGRAM SquareTest;

USES Complex;

VAR x1, x2, y1, y2 : INTEGER;
	action : STRING;

	PROCEDURE ComplexWrite( x1, x2, y1, y2 : INTEGER; action : STRING);
	BEGIN
		Write('z = (',x1);
		IF y1 < 0 THEN Write(' - ', Abs(y1))
		ELSE Write(' + ', y1);
		Write('i) ', action, ' ');
		Write('(',x2);
		IF y2 < 0 THEN Write(' - ', Abs(y2))
		ELSE Write(' + ', y2);
		Write('i) ');
	END;

BEGIN

	WriteLn('WRITE DATA');
	Write('x1 = ');
	ReadLn( x1 );
	Write('y1 = ');
	ReadLn( y1 );
	Write('x2 = ');
	ReadLn( x2 );
	Write('y2 = ');
	ReadLn( y2 );
	WriteLn();
	WriteLn('actions : +, -, *, /, z');
	WriteLn();
	Write('action : ');
	ReadLn(action);
	WriteLn();
	CASE action OF
	'+' :
		BEGIN
			ComplexWrite( x1, x2, y1, y2, action );
			WriteLn('= ', Addition( x1, x2, y1, y2 ) )
		END;
	'-' : 
		BEGIN
			ComplexWrite( x1, x2, y1, y2, action );
			WriteLn('= ', Subtraction( x1, x2, y1, y2 ) ) 
		END;
	'*' : 
		BEGIN
			ComplexWrite( x1, x2, y1, y2, action );
			WriteLn('= ', Multiplication( x1, x2, y1, y2 ) )
		END;
	'/' : 
		BEGIN
			ComplexWrite( x1, x2, y1, y2, action );
			WriteLn('= ', Segmentation( x1, x2, y1, y2 ) )
		END;
	'z' :
		BEGIN
			NumberWrite( x1, x2, y1, y2 );
			WriteLn();
		END;
	END;
	
END.
