PROGRAM recproc;

USES SysUtils;

TYPE RecMass = ARRAY OF RECORD
                   surname : STRING;
                   name : STRING;
                   gender : STRING
               END;
               
VAR People : RecMass;
	i, k, re, sres, num : INTEGER;
	command, tp, str : STRING;
	work : BOOLEAN;

	PROCEDURE ListMass ( People : RecMass; k : INTEGER );
	VAR i : INTEGER;
	BEGIN
		WriteLn('Reading array of the records...');
		WriteLn();
		FOR i := 1 TO k DO BEGIN
			WriteLn(i, ' PEOPLE');
			Write(People[i].surname, ' ');
			Write(People[i].name, ', ');
			WriteLn(People[i].gender);
			IF ( i <> k ) THEN WriteLn();
		END;
	END;
	
	PROCEDURE AddEl ( VAR People : RecMass; VAR k : INTEGER );
	BEGIN
		WriteLn('Adding element... ');
		k := k + 1;
		SetLength( People, k );
		Write('Surname: ');
		ReadLn( People[ k ].surname );
		Write('Name: ');
		ReadLn( People[ k ].name );
		Write('Gender: ');
		ReadLn( People[ k ].gender );
		WriteLn('Complete!');
	END;

	PROCEDURE RemoveEl ( VAR People : RecMass; VAR k : INTEGER; el : INTEGER);
	VAR i : INTEGER;
	BEGIN
		Write('Deleting element ', el, '... ');
		IF ( el = 0 ) THEN Write('You cant delete 0 element because he is NULL! ')
		ELSE BEGIN
			FOR i := el TO (k - 1) DO BEGIN
				People[i] := People[i + 1];
			END;
			k := k - 1;
			SetLength( People, k );
		END;
		WriteLn('Complete!');
	END;
	
	FUNCTION SearchEl ( People : RecMass; k : INTEGER; tp : STRING; field : STRING ): INTEGER; OVERLOAD;
	VAR i : INTEGER;
		f : BOOLEAN;
	BEGIN
		Write('Searching ', field, '... ');
		
		f := FALSE;
		i := 0;
		WHILE (i <= k) and (NOT f) DO BEGIN
			i := i + 1;
			CASE tp OF
			'name' : IF ( People[i].name = field ) THEN f := TRUE;
			'surname' : IF ( People[i].surname = field ) THEN f := TRUE;
			'gender' : IF ( People[i].gender = field ) THEN f := TRUE;
			'number' : IF ( IntToStr(i) = field ) THEN f := TRUE;
			END;
		END;
		
		
		
		WriteLn('Complete!');
		IF f = TRUE THEN SearchEl := i
		ELSE SearchEl := 0;
	END;
	
	FUNCTION SearchEl ( People : RecMass; k : INTEGER; tp : STRING; field : INTEGER ): INTEGER; OVERLOAD;
	VAR i : INTEGER;
		f : BOOLEAN;
	BEGIN
		WriteLn('Searching ', field, ' element... ');
		
		f := FALSE;
		i := 0;
		WHILE (k > 0) and (i <= k) and (NOT f) DO BEGIN
			i := i + 1;
			IF ( i = field ) THEN f := TRUE;
		END;
		
		IF f = TRUE THEN BEGIN 
			WriteLn(i, ' PEOPLE');
			Write(People[i].surname, ' ');
			Write(People[i].name, ', ');
			WriteLn(People[i].gender);
			SearchEl := i
		END
		ELSE SearchEl := 0;
	END;
	
	PROCEDURE RandFill ( VAR People : RecMass; VAR k : INTEGER );
	BEGIN
		Write('Random fill... ');
	
		Randomize;
		k := k + Random(10) + 2;
		SetLength(People, k + 1);

		WriteLn('k = ', k);

		FOR i := 1 TO k DO BEGIN
			People[i].surname := 'Surname' + IntToStr(i);
			People[i].name := 'Name' + IntToStr(i);
			People[i].gender := 'm';
		END;
		WriteLn('Complete!');
	END;
	
	PROCEDURE Clear ( VAR People : RecMass; VAR k : INTEGER );
	BEGIN
		Write('Clear array... ');
		Randomize;
		k := 0;
		SetLength( People, k );
		WriteLn('Complete!');
	END;

BEGIN
	
	k := 0;
	
	WriteLn('COMMANDS');
	WriteLn('add - add new element,');
	WriteLn('remove - remove element,');
	WriteLn('search - search element,');
	WriteLn('list - write list of array elements,');
	WriteLn('randfill - random fill array.');
	WriteLn('clear - clear array.');
	WriteLn();
	
	work := TRUE;
	WHILE (work = TRUE)  DO BEGIN
		Write('Command: ');
		ReadLn(command);
		CASE command OF
		'add' : AddEl( People, k );
		'remove' : BEGIN Write('Element number: '); ReadLn( re ); RemoveEl( People, k, re ) END;
		'search' : BEGIN 
		             Write('Type (name, surname, gender or number): '); 
		             ReadLn( tp ); 
		             IF ( tp = 'name' ) THEN BEGIN
						Write('Name: ');
						ReadLn(str);
						sres := SearchEl( People, k, 'name', str );
						IF ( sres <> 0) THEN WriteLn( 'Searching element is ', sres )
						ELSE WriteLn('No such element exists.');
                     END
                     ELSE IF ( tp = 'surname' ) THEN BEGIN
						Write('Surname: ');
						ReadLn(str);
						sres := SearchEl( People, k, 'surname', str );
						IF ( sres <> 0 ) THEN WriteLn( 'Searching element is ', sres)
						ELSE WriteLn('No such element exists.');
                     END
                     ELSE IF ( tp = 'gender' ) THEN BEGIN
						Write('Gender: ');
						ReadLn(str);
						sres := SearchEl( People, k, 'gender', str );
						IF ( sres <> 0) THEN WriteLn( 'Searching element is ', sres )
						ELSE WriteLn('No such element exists.');
                     END
                     ELSE IF ( tp = 'number' ) THEN BEGIN
						Write('Number: ');
						ReadLn(num);
						sres := SearchEl( People, k, 'number', num );
						IF ( sres = 0) THEN WriteLn('No such element exists.');
                     END
		END;
		'list' : ListMass( People, k );
		'randfill' : RandFill( People, k );
		'clear' : Clear( People, k );
		END;
		WriteLn();
	END;

END.
