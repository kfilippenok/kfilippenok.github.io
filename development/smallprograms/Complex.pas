UNIT Complex;

INTERFACE
	FUNCTION Addition( x1, x2, y1, y2 : INTEGER ) : STRING;
	FUNCTION Subtraction( x1, x2, y1, y2 : INTEGER ) : STRING;
	FUNCTION Multiplication( x1, x2, y1, y2 : INTEGER ) : STRING;
	FUNCTION Segmentation( x1, x2, y1, y2 : INTEGER ) : STRING;
	PROCEDURE NumberWrite( x1, x2, y1, y2 : INTEGER);

IMPLEMENTATION
	
	USES SysUtils;

	FUNCTION Addition( x1, x2, y1, y2 : INTEGER ) : STRING;
	BEGIN
		Addition := IntToStr( x1 + x2 );
		
		IF ( y1 + y2 ) < 0 THEN Addition := Addition + ' - ' 
		ELSE Addition := Addition + ' + ';
		
		Addition := Addition + IntToStr( Abs(y1 + y2) ) + 'i';
	END;
	
	FUNCTION Subtraction( x1, x2, y1, y2 : INTEGER ) : STRING;
	BEGIN
		Subtraction := IntToStr( x1 - x2 );
		
		IF ( y1 - y2 ) < 0 THEN Subtraction := Subtraction + ' - ' 
		ELSE Subtraction := Subtraction + ' + ';
		
		Subtraction := Subtraction + IntToStr( Abs(y1 - y2) ) + 'i';
	
	END;
	
	FUNCTION Multiplication( x1, x2, y1, y2 : INTEGER ) : STRING;
	VAR x, y : INTEGER;
	BEGIN
		x := (x1 * x2) - (y1 * y2);
		Multiplication := IntToStr( x );
		
		y := (x1 * y2) + (y1 * x2);
		IF ( y < 0 ) THEN Multiplication := Multiplication + ' - ' 
		ELSE Multiplication := Multiplication + ' + ';
		
		Multiplication := Multiplication + IntToStr( Abs(y) ) + 'i';
	END;
	
	FUNCTION Segmentation( x1, x2, y1, y2 : INTEGER ) : STRING;
	VAR a1, a2, b: INTEGER;
		x, y : STRING;
	BEGIN
		a1 := (x1 * x2) + (y1 * y2);
		a2 := (x2 * y1) - (x1 * y2);
		x := '(' + IntToStr( a1 );
		IF ( a2 < 0 ) THEN x := x + ' - ' 
		ELSE x := x + ' + ';
		x := x + IntToStr( Abs(a2) ) + 'i)';
		
		b := (x2 * x2) + (y2 * y2);
		y := IntToStr( b );
		
		Segmentation := x + ' / ' + y;
	END;

	PROCEDURE NumberWrite( x1, x2, y1, y2 : INTEGER);
	BEGIN
		Write('z = (',x1);
		IF y1 < 0 THEN Write(' - ', Abs(y1))
		ELSE Write(' + ', y1);
		Write('i) [ +, -, *, / ] ');
		Write('(',x2);
		IF y2 < 0 THEN Write(' - ', Abs(y2))
		ELSE Write(' + ', y2);
		Write('i) ');
	END;

END.
