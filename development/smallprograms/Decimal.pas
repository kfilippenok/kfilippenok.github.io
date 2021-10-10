UNIT Decimal;

INTERFACE
	FUNCTION Addition( x1, x2, y1, y2 : INTEGER ) : STRING;
	FUNCTION Subtraction( x1, x2, y1, y2 : INTEGER ) : STRING;
	FUNCTION Multiplication( x1, x2, y1, y2 : INTEGER ) : STRING;
	FUNCTION Segmentation( x1, x2, y1, y2 : INTEGER ) : STRING;
	FUNCTION DecCut( x, y : INTEGER ) : STRING;
	PROCEDURE DecWrite( x, y : INTEGER);

IMPLEMENTATION
	
	USES SysUtils;
	
	FUNCTION NOD( a, b : INTEGER ) : INTEGER;
	BEGIN
		IF (b = 0) THEN 
			NOD := a
		ELSE 
			NOD := NOD( b, a MOD b );
	END;
	
	FUNCTION Addition( x1, x2, y1, y2 : INTEGER ) : STRING;
	VAR x, y, d : INTEGER;
	BEGIN
		x := (x1 * y2) + (x2 * y1);
		y := y1 * y2;
		d := NOD( x, y );
		x := Round( x / d );
		y := Round( y / d );
		IF ( y = 1 ) THEN Addition := IntToStr( x )
		ELSE Addition := IntToStr( x ) + ' / ' + IntToStr( y );
	END;
	
	FUNCTION Subtraction( x1, x2, y1, y2 : INTEGER ) : STRING;
	VAR x, y, d : INTEGER;
	BEGIN
		x := (x1 * y2) - (x2 * y1);
		y := y1 * y2;
		d := NOD( x, y );
		x := Round( x / d );
		y := Round( y / d );
		IF ( y = 1 ) THEN Subtraction := IntToStr( x )
		ELSE Subtraction := IntToStr( x ) + ' / ' + IntToStr( y );
	END;
	
	FUNCTION Multiplication( x1, x2, y1, y2 : INTEGER ) : STRING;
	VAR x, y, d : INTEGER;
	BEGIN
		x := x1 * x2;
		y := y1 * y2;
		d := NOD( x, y );
		x := Round( x / d );
		y := Round( y / d );
		IF ( y = 1 ) THEN Multiplication := IntToStr( x )
		ELSE Multiplication := IntToStr( x ) + ' / ' + IntToStr( y );
	END;
	
	FUNCTION Segmentation( x1, x2, y1, y2 : INTEGER ) : STRING;
	VAR x, y, d : INTEGER;
	BEGIN
		x := x1 * y2;
		y := y1 * x2;
		d := NOD( x, y );
		x := Round( x / d );
		y := Round( y / d );
		IF ( y = 1 ) THEN Segmentation := IntToStr( x )
		ELSE Segmentation := IntToStr( x ) + ' / ' + IntToStr( y );
	END;

	FUNCTION DecCut( x, y : INTEGER ) : STRING;
	VAR d : INTEGER;
	BEGIN
		d := NOD( x, y );
		x := Round( x / d );
		y := Round( y / d );
		IF ( y = 1 ) THEN DecCut := IntToStr( x )
		ELSE DecCut := IntToStr( x ) + ' / ' + IntToStr( y );
	END;

	PROCEDURE DecWrite( x, y : INTEGER);
	BEGIN
		WriteLn('z = ', x, ' / ', y);
	END;

END.
