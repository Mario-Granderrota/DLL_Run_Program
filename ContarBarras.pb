Global _textoExe0.s, _textoParametro1.s, _textoParametro2.s, _textoParametro3.s, _textoParametro4.s
Global _textoParametro5.s, _textoParametro6.s, _textoParametro7.s, _textoParametro8.s, _textoParametro9.s
Global _numeroParametros.i

Procedure.i ContarBarras(_texto.s)
    Protected _inicio.i = 1
    Protected _fin.i
    Protected _longitud.i = Len(_texto)
    
    ; Si el texto comienza con una barra y la segunda posición no es una barra, eliminar la primera barra.
    If Left(_texto, 1) = "/" And Mid(_texto, 2, 1) <> "/" 
        _texto = Mid(_texto, 2)
    ElseIf Left(_texto, 2) = "//" ; Si comienza con "//", reemplazar con "X/"
        _texto = "X/" + Mid(_texto, 3)
    EndIf
    
    ; Sustituir "//" por "/X/" en un bucle para reemplazar todas las instancias
    While FindString(_texto, "//") <> 0
        _texto = ReplaceString(_texto, "//", "/X/")
    Wend
    
    ; Eliminar barra al inicio y al final si existe
    If Left(_texto, 1) = "/" : _texto = Right(_texto, _longitud - 1) : EndIf
    _longitud = Len(_texto)
    If Right(_texto, 1) = "/" : _texto = Left(_texto, _longitud - 1) : EndIf
    
    ; Dividir texto y asignar a variables de parametros
    _numeroParametros = 0
    Repeat
        _fin = FindString(_texto, "/", _inicio)
        If _fin = 0
            _fin = Len(_texto) + 1
        EndIf
        _numeroParametros = _numeroParametros + 1
        Select _numeroParametros
            Case 1
                _textoExe0 = Mid(_texto, _inicio, _fin - _inicio)
            Case 2
                _textoParametro1 = Mid(_texto, _inicio, _fin - _inicio)
            Case 3
                _textoParametro2 = Mid(_texto, _inicio, _fin - _inicio)
            Case 4
                _textoParametro3 = Mid(_texto, _inicio, _fin - _inicio)
            Case 5
                _textoParametro4 = Mid(_texto, _inicio, _fin - _inicio)
            Case 6
                _textoParametro5 = Mid(_texto, _inicio, _fin - _inicio)
            Case 7
                _textoParametro6 = Mid(_texto, _inicio, _fin - _inicio)
            Case 8
                _textoParametro7 = Mid(_texto, _inicio, _fin - _inicio)
            Case 9
                _textoParametro8 = Mid(_texto, _inicio, _fin - _inicio)
            Case 10
                _textoParametro9 = Mid(_texto, _inicio, _fin - _inicio)
        EndSelect
        _inicio = _fin + 1
    Until _inicio > Len(_texto)
    
    ProcedureReturn _numeroParametros
EndProcedure
