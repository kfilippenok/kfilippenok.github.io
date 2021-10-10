UNIT Square;

INTERFACE
	FUNCTION Rectangle( a, b : REAL ) : REAL;
	FUNCTION Circle( r : REAL ) : REAL;
	FUNCTION TriangleRight( a, b : REAL ) : REAL;
	FUNCTION Rhombus( d1, d2 : REAL ) : REAL;
	FUNCTION Oval( a, b : REAL ) : REAL;

IMPLEMENTATION
	
	FUNCTION Rectangle( a, b : REAL ) : REAL;
	BEGIN
		Rectangle := a * b;
	END;
	
	FUNCTION Circle( r : REAL ) : REAL;
 	BEGIN
		Circle := r * r * pi;
	END;

	FUNCTION TriangleRight( a, b : REAL ) : REAL;
 	BEGIN
		TriangleRight := ( a * b ) / 2;
	END;

	FUNCTION Rhombus( d1, d2 : REAL ) : REAL;
 	BEGIN
		Rhombus := ( d1 * d2 ) / 2;
	END;
	
	FUNCTION Oval( a, b : REAL ) : REAL;
 	BEGIN
		Oval := ( a * b ) * pi;
	END;

END.
