;;;;;;;         ELENA ORTIZ MORENO      INGENIERÍA DEL CONOCIMIENTO UGR UNIDAD 6      2021           ;;;;;;;
;;;;;;; Asesorar a un estudiante de ingeniería informática como lo haría un compañero, sobre qué rama elegir. ;;;;;;;

;;; Listado de las ramas disponibles

(deffacts Ramas
  (Rama Computacion_y_Sistemas_Inteligentes)
  (Rama Ingenieria_del_Software)
  (Rama Ingenieria_de_Computadores)
  (Rama Sistemas_de_Informacion)
  (Rama Tecnologias_de_la_Informacion)
)

;;;;; REGLAS DEL SISTEMA ;;;;;

;;; Cada respuesta recogida en cada pregunta del sistema es comprobada para tener todos los datos correctos

;;; Pregunta 1: Para saber si al usuario le gustan las matematicas

(defrule Matematicas
  (declare (salience 9))
  (Modulo (nombre ramas))
=>
  (printout t "¿Te gustan las matematicas? (Si/No)" crlf)
  (assert (Matematicas (read)))
)

(defrule Matematicas_check
  (declare (salience 100))
  (Modulo (nombre ramas))
  ?f <- (Matematicas ?r)
  (test (and (neq ?r Si) (neq ?r No) (neq ?r Fin)))
=>
  (printout t "No te entiendo. ¿Te gustan las matematicas? (Si/No)" crlf)
  (retract ?f)
  (assert (Matematicas (read)))
)

;;; Pregunta 2: ¿Se considera trabajador?

(defrule Es_trabajador
  (declare (salience 9))
  (Modulo (nombre ramas))
  (Matematicas Si)
=>
  (printout t "¿Eres trabajador? (Mucho/Normal/Poco)" crlf)
  (assert (Es_trabajador (read)))
)


(defrule Es_trabajador_check
  (declare (salience 100))
  (Modulo (nombre ramas))
  ?f <- (Es_trabajador ?r)
  (test (and (neq ?r Mucho) (neq ?r Normal) (neq ?r Poco) (neq ?r Fin)))
=>
  (printout t "No te entiendo. ¿Te gusta trabajar? (Mucho/Normal/Poco)" crlf)
  (retract ?f)
  (assert (Es_trabajador (read)))
)

;;; Pregunta 3: Saber si al usuario le gusta programar

(defrule Programacion
  (declare (salience 9))
  (Modulo (nombre ramas))
  (Matematicas Si)
  (or (Es_trabajador Mucho) (Es_trabajador Normal))
=>
  (printout t "¿Te gusta programar? (Si/No/No se)" crlf)
  (assert (Programacion (explode$ (readline))))
)

(defrule Programacion_check
  (declare (salience 100))
  (Modulo (nombre ramas))
  ?f <- (Programacion ?r)
  (test (and (neq ?r Si) (neq ?r No) (neq ?r No se) (neq ?r Fin)))
=>
  (printout t "No te entiendo. ¿Te gusta programar? (Si/No/No se)" crlf)
  (retract ?f)
  (assert (Programacion (explode$ (readline))))
)

;;; Pregunta 4: ¿Te gusta el hardware?

(defrule Hardware
  (declare (salience 9))
  (Modulo (nombre ramas))
  (Matematicas No)
=>
  (printout t "¿Te gusta el hardware? (Si/No/No se)" crlf)
  (assert (Hardware (explode$ (readline))))
)

(defrule Hardware_check
  (declare (salience 100))
  (Modulo (nombre ramas))
  ?f <- (Hardware ?r)
  (test (and (neq ?r Si) (neq ?r No) (neq ?r No se) (neq ?r Fin)))
=>
  (printout t "No te entiendo. ¿Te gustan el hardware? (Si/No/No se)" crlf)
  (retract ?f)
  (assert (Hardware (explode$ (readline))))
)

;;; Pregunta 5: ¿Publico, privado o docencia?

(defrule Trabajar
  (declare (salience 9))
  (Modulo (nombre ramas))
  (Matematicas No)
  (Hardware Si)
=>
  (printout t "¿En que sector prefieres trabajar? (Publica/Privada/Docencia/No se)" crlf)
  (assert (Trabajar (explode$ (readline))))
)

(defrule Trabajar_check
  (declare (salience 100))
  (Modulo (nombre ramas))
  ?f <- (Trabajar ?r)
  (test (and (neq ?r Publica) (neq ?r Privada) (neq ?r Docencia) (neq ?r No se) (neq ?r Fin)))
=>
  (printout t "No te entiendo. ¿En que sector prefieres trabajar? (Publica/Privada/Docencia/No se)" crlf)
  (retract ?f)
  (assert (Trabajar (explode$ (readline))))
)

;;; Pregunta 6: Nota media

(defrule Nota
  (declare (salience 9))
  (Modulo (nombre ramas))
  (Matematicas No)
  (Hardware No)
=>
  (printout t "Introduce tu calificacion media de expediente" crlf)
  (bind ?num (read))
  (while (and (not (numberp ?num)) (not (eq ?num Fin)))
    (printout t "Introduce tu calificacion media de expediente: " crlf)
    (bind ?num (read)))
  (assert (Calificacion_media ?num))
)

(defrule Nota_check
  (declare (salience 100))
  (Modulo (nombre ramas))
  ?f <- (Calificacion_media ?r)
  (test (or (> ?r 10) (< ?r 5)))
=>
  (printout t "Digame tu calificacion media para poder ayudarte" crlf)
  (retract ?f)
  (bind ?num (read))
  (while (and (not (numberp ?num)) (not (eq ?num Fin)))
    (printout t "Introduce tu calificacion media de expediente" crlf)
    (bind ?num (read)))
  (assert (Calificacion_media ?num))
)

;;; Nota Alta

(defrule Nota_alta
  (declare (salience 20))
  (Modulo (nombre ramas))
  (Calificacion_media ?r)
  (test (>= ?r 8))
=>
  (assert (Nota Alta))
)

;;; Nota Media

(defrule Nota_media
  (declare (salience 20))
  (Modulo (nombre ramas))
  (Calificacion_media ?r)
  (test (and (>= ?r 6) (< ?r 8)))
=>
  (assert (Nota Media))
)

;;; Nota Baja

(defrule Nota_baja
  (declare (salience 20))
  (Modulo (nombre ramas))
  (Calificacion_media ?r)
  (test (and (>= ?r 5) (< ?r 6)))
=>
  (assert (Nota Baja))
)

;;; Regla para imprimir un consejo ;;;

(defrule imprime_consejo
  (Modulo (nombre ramas))
  (Consejo ?rama ?texto)
=>
  (printout t "La rama " ?rama " podria irte bien." crlf)
  (printout t "Motivo: " ?texto "." crlf)
)

;;; Reglas para elegir una rama

(defrule Rama_CSI
  (declare (salience 10))
  (Modulo (nombre ramas))
  (Matematicas Si)
  (or (Es_trabajador Mucho) (Es_trabajador Normal))
  (Programacion Si)
=>
  (assert (Consejo Computacion_y_Sistemas_Inteligentes "te gustan las matematicas y programar y ademas eres trabajador"))
)

(defrule Rama_IS_1
  (declare (salience 10))
  (Modulo (nombre ramas))
  (Matematicas Si)
  (Es_trabajador Poco)
=>
  (assert (Consejo Ingenieria_del_Software "te gustan las matematicas pero no quieres tener mucha carga de trabajo"))
)

(defrule Rama_IS_2
  (declare (salience 10))
  (Modulo (nombre ramas))
  (Matematicas No)
  (Hardware No)
  (Nota Media)
=>
  (assert (Consejo Ingenieria_del_Software "no te gustan ni las matematicas ni el hardware y no tienes calificaciones altas por lo que te aconsejo una Rama mas general"))
)

(defrule Rama_IC_1
  (declare (salience 10))
  (Modulo (nombre ramas))
  (Matematicas Si)
  (or (Es_trabajador Mucho) (Es_trabajador Normal))
  (Programacion No)
=>
  (assert (Consejo Ingenieria_de_Computadores "te gustan las matematicas y eres trabajador pero no te gusta programar"))
)

(defrule Rama_IC_2
  (declare (salience 10))
  (Modulo (nombre ramas))
  (Matematicas No)
  (Hardware Si)
  (Trabajar Publica)
=>
  (assert (Consejo Ingenieria_de_Computadores "te gusta el hardware y la empresa publica"))
)


(defrule Rama_SI
  (declare (salience 10))
  (Modulo (nombre ramas))
  (Matematicas No)
  (Hardware No)
  (or (Nota Alta) (Nota Media))
=>
  (assert (Consejo Sistemas_de_Informacion "no te gustan las matematicas ni el hardware pero tienes buen expediente"))
)

(defrule Rama_TI
  (declare (salience 10))
  (Modulo (nombre ramas))
  (Matematicas No)
  (Hardware Si)
  (or (Trabajar Privada) (Trabajar Docencia))
=>
  (assert (Consejo Tecnologias_de_la_Informacion "te gustaria trabajar en la publica o docencia y te gusta el hardware pero no las mates"))
)

(defrule Rama_TI_No_se
  (declare (salience 10))
  (Modulo (nombre ramas))
  (Matematicas No)
  (Hardware Si)
  (Trabajar No se)
=>
  (assert (Consejo Tecnologias_de_la_Informacion "no sabes donde trabajar pero te gusta el hardware y no las mates"))
  (assert (Consejo Ingenieria_de_Computadores "te gusta el hardware por lo que esta es una buena opcion si descubres que te gustaria trabajar en la Empresa Publica"))
)

(defrule Rama_CSI_No_se
  (declare (salience 10))
  (Modulo (nombre ramas))
  (Matematicas Si)
  (or (Es_trabajador Mucho) (Es_trabajador Normal))
  (Programacion No se)
=>
  (assert (Consejo Computacion_y_Sistemas_Inteligentes "no sabes seguro si te gusta programar pero trabajas bien y te gustan las matematicas"))
  (assert (Consejo Ingenieria_de_Computadores "si descubres que no te gusta programar, esta puede ser una buena eleccion"))
)

(defrule Hardware_No_se
  (declare (salience 10))
  (Modulo (nombre ramas))
  ?f <- (Hardware No se)
=>
  (printout t "¿Te gusto Estructura de computadores? (Si/No)" crlf)
  (retract ?f)
  (bind ?a (read))
  (while (and (neq ?a Si) (neq ?a No) (neq ?a Fin))
    (printout t "¿Te gusto Estructura de computadores? (Si/No)" crlf)
    (bind ?a (read)))
  (assert (Hardware ?a))
)

(defrule Fin_1
  (declare (salience 100))
  (Modulo (nombre ramas))
  (Matematicas Fin)
=>
  (assert (Consejo Computacion_y_Sistemas_Inteligentes "no me has dado ninguna informacion, esta es la especialidad mas escogida"))
)

(defrule Fin_2
  (declare (salience 100))
  (Modulo (nombre ramas))
  (Matematicas Si)
  (Es_trabajador Fin)
=>
  (assert (Consejo Computacion_y_Sistemas_Inteligentes "te gustan las matematicas"))
)

(defrule Fin_3
  (declare (salience 100))
  (Modulo (nombre ramas))
  (Matematicas Si)
  (or (Es_trabajador Mucho) (Es_trabajador Normal))
  (Programacion Fin)
=>
  (assert (Consejo Computacion_y_Sistemas_Inteligentes "te gustan las matematicas y eres trabajador"))
)

(defrule Fin_4
  (declare (salience 100))
  (Modulo (nombre ramas))
  (Matematicas No)
  (Hardware Fin)
=>
  (assert (Consejo Ingenieria_de_Computadores "no te gustan las matematicas"))
)

(defrule Fin_5
  (declare (salience 100))
  (Modulo (nombre ramas))
  (Matematicas No)
  (Hardware Si)
  (Trabajar Fin)
=>
  (assert (Consejo Ingenieria_de_Computadores "no te gustan las matematicas pero te gusta el hardware"))
)

(defrule No_rama
  (declare (salience 10))
  (Modulo (nombre ramas))
  (Matematicas No)
  (Hardware No)
  (Nota Baja)
=>
  (printout t "No hagas ninguna rama." crlf)
)
