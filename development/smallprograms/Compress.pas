PROGRAM Compress;

LABEL m1, m2;

VAR a, b: ARRAY OF smallint;
    i, k, n, p, t, srav: smallint;

BEGIN
    i := -1; t:= 1; k:= -1; srav:= 0; p:= 1;
    
    WriteLn('Вводите цифры. Для прерывания цикла введите любое число, не равное 0 или 1.');
    m1: ReadLn(n);
    IF (n = 1) OR (n = 0) THEN BEGIN
        // Выделение места и помещение нового n в элемент массива a.  
        i += 1;
        setLength(a, i + 1);
        a[i] := n;
        
        // Проверка 1 (a[0]) элемента, является ли он 1 или 0.
        IF p = 1 THEN
            IF a[0] = 1 THEN BEGIN
                k+= 1;
                setLength(b, k + 1);
                b[k]:= 0;
                p:= 0;
            END;
            
        // Вычисление количества повторяющихся элементов и занесение значения в новый массив b.
        m2: IF t = 1 THEN BEGIN // Проверка ключа
                k += 1;
                setLength(b, k + 1);  // Выделение нового элемента массива
                b[k]:= 0;
                srav := i;  // Присваевание переменной srav значение i для сравнения на идентичность.
            END;
        IF a[i] = a[srav] THEN BEGIN
            b[k] += 1;
            t:= 0;  // Потеря ключа.
        END
        ELSE BEGIN
            t:= 1;  // Восстановление ключа.
            goto m2;
        END;
        
        goto m1;
    END;
    WriteLn('Конец ввода.');
    
    WriteLn('');
    
    FOR p := 0 TO i DO WriteLn('a[', p, '] = ', a[p]);
    
    WriteLn('');	
    
    FOR p := 0 TO k DO WriteLn('b[', p, '] = ', b[p]);
END.
