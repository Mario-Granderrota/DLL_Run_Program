ProcedureDLL.i AbrirProgramaConParametros(_numeroParametros.i,_textoExe0.s, _textoParametro1.s, _textoParametro2.s, _textoParametro3.s, _textoParametro4.s, _textoParametro5.s, _textoParametro6.s, _textoParametro7.s, _textoParametro8.s, _textoParametro9.s)
    Protected _ejecutar.s="" 
    Protected _parametros.s=""
    Protected _i.i ; Declaramos explícitamente la variable _i
    Protected _programID.i
    Protected _programHandle.i
    
    _ejecutar = _textoExe0
    For _i = 1 To _numeroParametros - 1
        Select _i
            Case 1: _parametros = _parametros + _textoParametro1 + " "
            Case 2: _parametros = _parametros + _textoParametro2 + " "
            Case 3: _parametros = _parametros + _textoParametro3 + " "
            Case 4: _parametros = _parametros + _textoParametro4 + " "
            Case 5: _parametros = _parametros + _textoParametro5 + " "
            Case 6: _parametros = _parametros + _textoParametro6 + " "
            Case 7: _parametros = _parametros + _textoParametro7 + " "
            Case 8: _parametros = _parametros + _textoParametro8 + " "
            Case 9: _parametros = _parametros + _textoParametro9 + " "
        EndSelect
    Next _i

    _programHandle = RunProgram(_ejecutar, _parametros, "", #PB_Program_Open)
    If _programHandle
        _programID = ProgramID(_programHandle)
        ProcedureReturn _programID ; Devuelve el ID del programa. Programa lanzado exitosamente
    Else
        ProcedureReturn 1 ;"No se pudo lanzar el programa"
    EndIf
EndProcedure
