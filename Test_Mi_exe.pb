EnableExplicit

Procedure PrintParameters()
  Protected Dim argumentList.s(100)  ; Declarar un array con un tamaño arbitrario
  Protected index.i = 0
  Protected numParameters.i
  Protected message.s

  numParameters = CountProgramParameters()  ; Obtiene el número de parámetros

  If numParameters > 0
    For index = 0 To numParameters - 1
      argumentList(index) = ProgramParameter(index)
      message + "Argumento " + Str(index+1) + ": " + argumentList(index) + #LF$
    Next
    MessageRequester("Argumentos", message)
  Else
    MessageRequester("Argumentos", "No se pasaron argumentos.")
  EndIf
EndProcedure

PrintParameters()

