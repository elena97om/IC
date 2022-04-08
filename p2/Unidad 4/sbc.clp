;;;;;;;         ELENA ORTIZ MORENO      INGENIERÍA DEL CONOCIMIENTO UGR UNIDAD 4     2021           ;;;;;;;
;;;;;;; controlador de los dos ejercicios sobre recomendación de ramas             ;;;;;;;

(deftemplate Modulo
  (slot nombre
    (type SYMBOL)
    (allowed-symbols ramas)
  )
)

(defrule seleccion
  (declare (salience 10000))
  (not (Modulo (nombre ?)))
  =>
  (printout t "Sobre que quiere una recomendacion? Introduzca ramas (unica opcion disponible) o Fin para terminar" crlf)
  (assert (Modulo (nombre (read))))
)

(defrule terminar_modulo
  (declare (salience -1000))
  ?f <- (Modulo (nombre ?nombre))
  (test (neq ?nombre Fin))
  =>
  (retract ?f)
)
