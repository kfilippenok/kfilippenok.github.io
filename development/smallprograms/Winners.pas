PROGRAM Winners;

{R+}

VAR a: ARRAY [1..10] OF Integer;
    i, imax1, imax2, imax3, tmp1, tmp2, tmp3, SravOne, SravTwo, SravThree: Integer;
	
BEGIN
    imax1:= 1; imax2:= 1; imax3:= 1; 
    tmp1 := 0; tmp2 := 0; tmp3 := 0;
    SravOne := 0; SravTwo := 0; SravThree := 0;
    WriteLn('Введите результаты');
    FOR i:=1 TO 10 DO BEGIN
        Write('Результат ', i, ' команды = ');
        ReadLn(a[i]);
        IF a[i] > SravOne THEN BEGIN
            imax3:= imax2;
            imax2:= imax1;
            imax1:= i;
            SravThree := SravTwo;
            SravTwo := SravOne;
            SravOne := a[i];
            tmp3 := tmp2;
            tmp2 := tmp1;
        END
        ELSE BEGIN
            IF a[i] = a[imax1] THEN 
                tmp1:= i
            ELSE BEGIN
                IF a[i] > SravTwo THEN BEGIN
                    imax3 := imax2;
                    imax2 := i;
                    SravThree := SravTwo;
                    SravTwo := a[i];
                END
                ELSE BEGIN
                    IF a[i] = SravTwo THEN
                        tmp2:= i
                    ELSE
                        IF a[i] > SravThree THEN BEGIN
                            imax3 := i;
                            SravThree := a[i];
                        END
                        ELSE IF a[i] = SravThree THEN tmp3:= i;
                END;
            END;
        END;
    END;

    // Вывод 1 места
    Write('1 место заняла(ли) '); 
    IF a[imax1] <> a[tmp1] THEN Write(imax1)
    ELSE Write(imax1, ' и ', tmp1);
    WriteLn(' команда(ы) с результатом ', a[imax1], '.');
    
    // Вывод 2 места
    Write('2 место заняла(ли) '); 
    IF a[imax2] <> a[tmp2] THEN Write(imax2)
    ELSE Write(imax2, ' и ', tmp2);
    WriteLn(' команда(ы) с результатом ', a[imax2], '.');
    
    // Вывод 3 места
    Write('3 место заняла(ли) '); 
    IF a[imax3] <> a[tmp3] THEN Write(imax3)
    ELSE Write(imax3, ' и ', tmp3);
    WriteLn(' команда(ы) с результатом ', a[imax3], '.');
END.
