;;;;;;;         ELENA ORTIZ MORENO      INGENIERÍA DEL CONOCIMIENTO UGR EJERCICIO 3      25/04/21           ;;;;;;;
;;;;;;; Asesorar a un estudiante de ingeniería informática como lo haría un compañero, sobre qué rama elegir. ;;;;;;;


;;; Representar las ramas ;;;

(deffacts Ramas
  (Rama Computacion_y_Sistemas_Inteligentes)
  (Rama Ingenieria_del_Software)
  (Rama Ingenieria_de_Computadores)
  (Rama Sistemas_de_Informacion)
  (Rama Tecnologias_de_la_Informacion)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; MENSAJE DE BIENVENIDA AL SISTEMA ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Motramos las diferentes Ramas y explicamos el funcionamiento ;;;

(defrule Da_bienvenida
  (declare (salience 10))
=>
  (printout t "Bienvenido al sistema de asesoramiento de ramas del Grado en I. Informatica. Las ramas son:" crlf)
  (printout t "- Computacion y Sistemas Inteligentes." crlf)
  (printout t "- Ingenieria del Software." crlf)
  (printout t "- Ingenieria de Computadores." crlf)
  (printout t "- Sistemas de Informacion." crlf)
  (printout t "- Tecnologias de la Informacion." crlf)
  (printout t "En cualquier momento puede responder Fin para obtener el consejo sin responder el resto de preguntas." crlf)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   PREGUNTAS DEL SISTEMA (CON CHECKEOS)   ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Si le gustan las matematicas ;;;

(defrule Gusta_mates
  (declare (salience 9))
=>
  (printout t "Te gustan las matematicas? (Si/No)" crlf)
  (assert (Gusta_mates (read)))
)

(defrule Gusta_mates_check
  (declare (salience 100))
  ?f <- (Gusta_mates ?r)
  (test (and (neq ?r Si) (neq ?r No) (neq ?r Fin))) ;si no se ha introducido una respuesta correcta
=>
  (printout t "Respuesta no valida. Te gustan las matematicas? (Si/No)" crlf) ;pregunto otra vez
  (retract ?f)
  (assert (Gusta_mates (read)))
)

;;; Cómo de trabajador se considera ;;;

(defrule Es_trabajador
  (declare (salience 9))
  (Gusta_mates Si)
=>
  (printout t "Eres trabajador? (Mucho/Normal/Poco)" crlf)
  (assert (Es_trabajador (read)))
)

(defrule Es_trabajador_check
  (declare (salience 100))
  ?f <- (Es_trabajador ?r)
  (test (and (neq ?r Mucho) (neq ?r Normal) (neq ?r Poco) (neq ?r Fin))) ;si no se ha introducido una respuesta correcta
=>
  (printout t "Respuesta no valida. Eres trabajador? (Mucho/Normal/Poco)" crlf) ;pregunto otra vez
  (retract ?f)
  (assert (Es_trabajador (read)))
)

;;; Si le gusta programar ;;;

(defrule Gusta_programar
  (declare (salience 9))
  (Gusta_mates Si)
  (or (Es_trabajador Mucho) (Es_trabajador Normal))
=>
  (printout t "Te gusta programar? (Si/No/No se)" crlf)
  (assert (Gusta_programar (explode$ (readline))))
)

(defrule Gusta_programar_check
  (declare (salience 100))
  ?f <- (Gusta_programar ?r)
  (test (and (neq ?r Si) (neq ?r No) (neq ?r No se) (neq ?r Fin))) ;si no se ha introducido una respuesta correcta
=>
  (printout t "Respuesta no valida. Te gusta programar? (Si/No/No se)" crlf) ;pregunto otra vez
  (retract ?f)
  (assert (Gusta_programar (explode$ (readline))))
)

;;; Si le gusta el hardware ;;;

(defrule Gusta_hardware
  (declare (salience 9))
  (Gusta_mates No)
=>
  (printout t "Te gusta el hardware? (Si/No/No se)" crlf)
  (assert (Gusta_hardware (explode$ (readline))))
)

(defrule Gusta_hardware_check
  (declare (salience 100))
  ?f <- (Gusta_hardware ?r)
  (test (and (neq ?r Si) (neq ?r No) (neq ?r No se) (neq ?r Fin))) ;si no se ha introducido una respuesta correcta
=>
  (printout t "Respuesta no valida. Te gustan el hardware? (Si/No/No se)" crlf) ;pregunto otra vez
  (retract ?f)
  (assert (Gusta_hardware (explode$ (readline))))
)

;;; En qué quiere trabajar ;;;

(defrule Trabajar
  (declare (salience 9))
  (Gusta_mates No)
  (Gusta_hardware Si)
=>
  (printout t "En que te gustaria trabajar? (Publica/Privada/Docencia/No se)" crlf)
  (assert (Trabajar (explode$ (readline))))
)

(defrule Trabajar_check
  (declare (salience 100))
  ?f <- (Trabajar ?r)
  (test (and (neq ?r Publica) (neq ?r Privada) (neq ?r Docencia) (neq ?r No se) (neq ?r Fin))) ;si no se ha introducido una respuesta correcta
=>
  (printout t "Respuesta incorrecta. En que te gustaria trabajar? (Publica/Privada/Docencia/No se)" crlf) ;pregunto otra vez
  (retract ?f)
  (assert (Trabajar (explode$ (readline))))
)

;;; La nota media que ha obtenido en las asignaturas que ha cursado hasta ahora ;;;

(defrule Nota
  (declare (salience 9))
  (Gusta_mates No)
  (Gusta_hardware No)
=>
  (printout t "Introduce tu calificacion media de expediente" crlf)
  (bind ?num (read))
  (while (and (not (numberp ?num)) (not (eq ?num Fin))) ;si no se ha introducido una respuesta correcta
    (printout t "Respuesta incorrecta (debe de ser flotante o entero). Introduce tu calificacion media de expediente" crlf) ;pregunto otra vez
    (bind ?num (read)))
  (if (eq ?num Fin) then (assert (Consejo Sistemas_de_Informacion "no te gustan las matematicas ni el hardware" "CLISP"))
  else (assert (Calificacion_media ?num)))
)

(defrule Nota_check_interval
  (declare (salience 99))
  ?f <- (Calificacion_media ?r)
  (test (or (> ?r 10) (< ?r 5))) ;si no se ha introducido una respuesta correcta
=>
  (printout t "Respuesta incorrecta (fuera de [5,10]). Introduce tu calificacion media de expediente" crlf) ;pregunto otra vez
  (retract ?f)
  (bind ?num (read))
  (while (and (not (numberp ?num)) (not (eq ?num Fin)))
    (printout t "Respuesta incorrecta (debe de ser flotante o entero). Introduce tu calificacion media de expediente" crlf)
    (bind ?num (read)))
  (if (eq ?num Fin) then (assert (Consejo Sistemas_de_Informacion "no te gustan las matematicas ni el hardware" "CLISP"))
  else (assert (Calificacion_media ?num)))
)

;;; Convertir la Calificacion_media a Nota ;;;

(defrule Nota_conversion_alta
  (declare (salience 20))
  (Calificacion_media ?r)
  (test (>= ?r 8)) ;si es mayor o igual que 8, será nota alta
=>
  (assert (Nota Alta))
)

(defrule Nota_conversion_media
  (declare (salience 20))
  (Calificacion_media ?r)
  (test (and (>= ?r 6.5) (< ?r 8))) ;si está entre 6'5 y 8, será nota media
=>
  (assert (Nota Media))
)

(defrule Nota_conversion_baja
  (declare (salience 20))
  (Calificacion_media ?r)
  (test (and (>= ?r 5) (< ?r 6.5))) ;si es menor a 6'5, será nota baja
=>
  (assert (Nota Baja))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   CONSEJOS DEL SISTEMA   ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Método para imprimir un consejo ;;;

(defrule imprime_consejo
  (Rama ?rama)          ; sirve para asegurarse de que la rama existe
  (Consejo ?rama ?texto ?experto)
=>
  (printout t ?experto " te aconseja la Rama de " ?rama "." crlf)
  (printout t "Motivo: " ?texto "." crlf)
)

;;; Rama de Computación y Sistemas Inteligentes ;;;

(defrule Rama_CSI
  (declare (salience 10))
  (Gusta_mates Si)
  (or (Es_trabajador Mucho) (Es_trabajador Normal))
  (Gusta_programar Si)
=>
  (assert (Consejo Computacion_y_Sistemas_Inteligentes "te gustan las matematicas y programar y ademas eres trabajador" "CLISP"))
)

;;; Rama de Ingeniería del Software ;;;

(defrule Rama_IS
  (declare (salience 10))
  (Gusta_mates Si)
  (Es_trabajador Poco)
=>
  (assert (Consejo Ingenieria_del_Software "te gustan las matematicas pero no quieres tener mucha carga de trabajo" "CLISP"))
)

(defrule Rama_IS2
  (declare (salience 10))
  (Gusta_mates No)
  (Gusta_hardware No)
  (Nota Baja)
=>
  (assert (Consejo Ingenieria_del_Software "no te gustan ni las matematicas ni el hardware y no tienes calificaciones altas por lo que te aconsejo una Rama mas general" "CLISP"))
)

;;; Rama de Ingeniería de Computadores ;;;

(defrule Rama_IC
  (declare (salience 10))
  (Gusta_mates Si)
  (or (Es_trabajador Mucho) (Es_trabajador Normal))
  (Gusta_programar No)
=>
  (assert (Consejo Ingenieria_de_Computadores "te gustan las matematicas y eres trabajador pero no te gusta programar" "CLISP"))
)

(defrule Rama_IC2
  (declare (salience 10))
  (Gusta_mates No)
  (Gusta_hardware Si)
  (Trabajar Publica)
=>
  (assert (Consejo Ingenieria_de_Computadores "te gusta el hardware y la empresa publica" "CLISP"))
)

;;; Rama de Sistemas de Información ;;;

(defrule Rama_SI
  (declare (salience 10))
  (Gusta_mates No)
  (Gusta_hardware No)
  (or (Nota Alta) (Nota Media))
=>
  (assert (Consejo Sistemas_de_Informacion "no te gustan las matematicas ni el hardware pero tienes buen expediente" "CLISP"))
)

;;; Rama de Tecnologías de la Información ;;;

(defrule Rama_TI
  (declare (salience 10))
  (Gusta_mates No)
  (Gusta_hardware Si)
  (or (Trabajar Privada) (Trabajar Docencia))
=>
  (assert (Consejo Tecnologias_de_la_Informacion "te gustaria trabajar en la publica o docencia y te gusta el hardware pero no las mates" "CLISP"))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   POSIBILIDAD DE RESPONDER "No se"   ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; No sabe a qué dedicarse ;;;

(defrule Rama_TI_No_se
  (declare (salience 10))
  (Gusta_mates No)
  (Gusta_hardware Si)
  (Trabajar No se)
=>
  (assert (Consejo Tecnologias_de_la_Informacion "no sabes donde trabajar pero te gusta el hardware y no las mates" "CLISP"))
  (assert (Consejo Ingenieria_de_Computadores "te gusta el hardware por lo que esta es una buena opcion si descubres que te gustaria trabajar en la Empresa Publica" "CLISP"))
)

;;; No sabe si le gusta programar ;;;

(defrule Rama_CSI_No_se
  (declare (salience 10))
  (Gusta_mates Si)
  (or (Es_trabajador Mucho) (Es_trabajador Normal))
  (Gusta_programar No se)
=>
  (assert (Consejo Computacion_y_Sistemas_Inteligentes "aunque no sabes si te gusta programar te gustan las matematicas y eres trabajador" "CLISP"))
  (assert (Consejo Ingenieria_de_Computadores "si descubres que no te gusta programar, esta puede ser una buena eleccion" "CLISP"))
)

;;; No sabe si le gusta el hardware ;;;

(defrule Gusta_hardware_No_se
  (declare (salience 10))
  ?f <- (Gusta_hardware No se)
=>
  (printout t "Te gustaron asignaturas como FFT, TOC y EC? (Si/No)" crlf)
  (retract ?f)
  (bind ?a (read))
  (while (and (neq ?a Si) (neq ?a No) (neq ?a Fin))
    (printout t "Respuesta incorrecta. Te gustaron asignaturas como FFT, TOC y EC? (Si/No)" crlf)
    (bind ?a (read)))
  (assert (Gusta_hardware ?a))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   POSIBILIDAD DE RESPONDER "Fin"   ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule Fin_1
  (declare (salience 100))
  (Gusta_mates Fin)
=>
  (assert (Consejo Computacion_y_Sistemas_Inteligentes "no me has dado ninguna informacion, esta es la especialidad mas escogida" "CLISP"))
)

(defrule Fin_2
  (declare (salience 100))
  (Gusta_mates Si)
  (Es_trabajador Fin)
=>
  (assert (Consejo Computacion_y_Sistemas_Inteligentes "te gustan las matematicas" "CLISP"))
)

(defrule Fin_3
  (declare (salience 100))
  (Gusta_mates Si)
  (or (Es_trabajador Mucho) (Es_trabajador Normal))
  (Gusta_programar Fin)
=>
  (assert (Consejo Computacion_y_Sistemas_Inteligentes "te gustan las matematicas y eres trabajador" "CLISP"))
)

(defrule Fin_4
  (declare (salience 100))
  (Gusta_mates No)
  (Gusta_hardware Fin)
=>
  (assert (Consejo Ingenieria_de_Computadores "no te gustan las matematicas" "CLISP"))
)

(defrule Fin_5
  (declare (salience 100))
  (Gusta_mates No)
  (Gusta_hardware Si)
  (Trabajar Fin)
=>
  (assert (Consejo Ingenieria_de_Computadores "no te gustan las matematicas pero te gusta el hardware" "CLISP"))
)
