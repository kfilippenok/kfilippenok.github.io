PROGRAM SquareTest;

USES Square;

VAR a, b, r : REAL;
	figure : STRING;

BEGIN
	
	WriteLn('CHOOSE FIGURE');
	WriteLn('sqaure - [ ], rectangle - [  ], circle - o,');
	WriteLn('trianright - L\, rhombus <>, oval - ()');
	WriteLn();
	ReadLn(figure);
	CASE figure OF
	'square', 'rectangle' : 
		BEGIN
			Write('a = ');
			ReadLn(a);
			Write('b = ');
			ReadLn(b);
			WriteLn( 'Square = ', Rectangle( a, b ) : 0 : 2 );
		END;
	'circle' :
		BEGIN
			Write('r = ');
			ReadLn(r);
			WriteLn( 'Square = ', Circle( r ) : 0 : 2 );
		END;
	'trianright' :
		BEGIN
			Write('a = ');
			ReadLn(a);
			Write('b = ');
			ReadLn(b);
			WriteLn( 'Square = ', TriangleRight( a, b ) : 0 : 2 );
		END;
	'rhombus' :
		BEGIN
			Write('d1 = ');
			ReadLn(a);
			Write('d2 = ');
			ReadLn(b);
			WriteLn( 'Square = ', Rhombus( a, b ) : 0 : 2 );
		END;
	'oval' :
		BEGIN
			Write('a = ');
			ReadLn(a);
			Write('b = ');
			ReadLn(b);
			WriteLn( 'Square = ', Oval( a, b ) : 0 : 2 );
		END;
	END;  
	
END.
