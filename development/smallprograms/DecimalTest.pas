PROGRAM DecimalTest;

USES Decimal;

VAR x1, x2, y1, y2 : INTEGER;
	action : STRING[1];

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
	WriteLn('actions : +, -, *, /, c, z');
	WriteLn();
	Write('action : ');
	ReadLn(action);
	WriteLn();
	CASE action OF
	'+' : WriteLn('z = ', Addition( x1, x2, y1, y2 ) );
	'-' : WriteLn('z = ', Subtraction( x1, x2, y1, y2 ) );
	'*' : WriteLn('z = ', Multiplication( x1, x2, y1, y2 ) );
	'/' : WriteLn('z = ', Segmentation( x1, x2, y1, y2 ) );
	'c' : WriteLn('z = ', DecCut( x1, y1 ));
	'z' : DecWrite( x1, y1 );
	END;
	
END.
