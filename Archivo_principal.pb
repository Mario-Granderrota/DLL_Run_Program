CompilerIf #PB_Compiler_Unicode
    EnableExplicit
    UsePNGImageDecoder()
CompilerEndIf

IncludeFile "ContarBarrasExe.pb"
IncludeFile "LanzarExe.pb"

Global _textoAcumulado.s = ""

ProcedureDLL.d MyFunction(_numerosPalabra1.d, _delimitadoresPalabra1.d, _faltaTexto.d, _finTexto.d)
    Protected _palabra1.s = ""
    Protected _palabraResultante.s = ""
    Protected _numerosPalabra1String.s = Str(_numerosPalabra1)
    Protected _delimitadoresPalabra1String.s = Str(_delimitadoresPalabra1)
    Protected _caracterActual.s = ""
    Protected _pos1.i = 1
    Protected _pos2.i = 1
    Protected _longitudSegmento.i = 0 

    If _finTexto = 2
        _textoAcumulado = ""
        ProcedureReturn 0
    EndIf

    While Len(_delimitadoresPalabra1String) > 0
        _pos1 = FindString(_delimitadoresPalabra1String, "1", _pos1)
        If _pos1 > 0
            _pos2 = _pos1 + 1
            While _pos2 <= Len(_delimitadoresPalabra1String) And Mid(_delimitadoresPalabra1String, _pos2, 1) <> "1"
                _pos2 = _pos2 + 1
            Wend
            _longitudSegmento = _pos2 - _pos1
            _caracterActual = Mid(_numerosPalabra1String, 1, _longitudSegmento)
            _palabra1 = _palabra1 + Chr(Val(_caracterActual))
            _numerosPalabra1String = Mid(_numerosPalabra1String, _longitudSegmento + 1)
            _delimitadoresPalabra1String = RemoveString(_delimitadoresPalabra1String, "1", #PB_String_CaseSensitive, 1, 1)
        Else
            Break
        EndIf
    Wend

    _palabraResultante = _palabra1
    _textoAcumulado = _textoAcumulado + _palabraResultante

    If _faltaTexto = 0
        If Len(_textoAcumulado) > 0
          _numeroParametros = ContarBarras(_textoAcumulado)
          _textoAcumulado = ""
            ProcedureReturn AbrirProgramaConParametros(_numeroParametros, _textoExe0, _textoParametro1, _textoParametro2, _textoParametro3, _textoParametro4, _textoParametro5, _textoParametro6, _textoParametro7, _textoParametro8, _textoParametro9)
            _textoAcumulado = ""
        Else
            ProcedureReturn 0 
          EndIf
          _textoAcumulado = ""
    Else
        ProcedureReturn 0 
      EndIf
EndProcedure
