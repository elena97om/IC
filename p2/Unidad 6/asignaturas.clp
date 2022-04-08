;;;;;;;         ELENA ORTIZ MORENO      INGENIERÍA DEL CONOCIMIENTO UGR UNIDAD 6     2021           ;;;;;;;
;;;;;;; Asesorar a un estudiante de ingeniería informática como lo haría un compañero, sobre qué asignatura elegir. ;;;;;;;

(deftemplate Asignaturas
  (slot nombre)
  (slot rama)
  (slot curso)
  (slot cuatrimestre)
  (slot dificultad)
)

(deffacts inicializar
  ;Asignaturass primero
  (Asignaturas (nombre Algebra_Lineal_Estructuas_Matematicas) (rama troncal) (curso 1) (cuatrimestre 1) (dificultad facil))
  (Asignaturas (nombre Calculo) (rama troncal) (curso 1) (cuatrimestre 1) (dificultad dificil))
  (Asignaturas (nombre Fundamentos_Programacion) (rama troncal) (curso 1) (cuatrimestre 1) (dificultad facil))
  (Asignaturas (nombre Fundamentos_Software) (rama troncal) (curso 1) (cuatrimestre 1) (dificultad normal))
  (Asignaturas (nombre Fundamentos_Fisicos_Tecnologicos) (rama troncal) (curso 1) (cuatrimestre 1) (dificultad normal))
  (Asignaturas (nombre Estadistica) (rama troncal) (curso 1) (cuatrimestre 2) (dificultad facil))
  (Asignaturas (nombre Ingenieria_Empresa_Sociedad) (rama troncal) (curso 1) (cuatrimestre 2) (dificultad facil))
  (Asignaturas (nombre Logica_Metodos_Discretos) (rama troncal) (curso 1) (cuatrimestre 2) (dificultad dificil))
  (Asignaturas (nombre Metodologia_Programacion) (rama troncal) (curso 1) (cuatrimestre 2) (dificultad dificil))
  (Asignaturas (nombre Tecnologia_Organizacion_Computadores) (rama troncal) (curso 1) (cuatrimestre 2) (dificultad facil))
  ;Asignaturass segundo
  (Asignaturas (nombre Sistemas_Concurrentes_Distribuidos) (rama obligatoria) (curso 2) (cuatrimestre 1) (dificultad dificil))
  (Asignaturas (nombre Sistemas_Operativos) (rama obligatoria) (curso 2) (cuatrimestre 1) (dificultad normal))
  (Asignaturas (nombre Estructuras_Datos) (rama obligatoria) (curso 2) (cuatrimestre 1) (dificultad facil))
  (Asignaturas (nombre Estructura_Computadores) (rama obligatoria) (curso 2) (cuatrimestre 1) (dificultad dificil))
  (Asignaturas (nombre Programacion_Disenio_Orientado_Objetos) (rama obligatoria) (curso 2) (cuatrimestre 1) (dificultad facil))
  (Asignaturas (nombre Algoritmica) (rama obligatoria) (curso 2) (cuatrimestre 2) (dificultad normal))
  (Asignaturas (nombre Arquitectura_Computadores) (rama obligatoria) (curso 2) (cuatrimestre 2) (dificultad dificil))
  (Asignaturas (nombre Fundamento_Bases_Datos) (rama obligatoria) (curso 2) (cuatrimestre 2) (dificultad facil))
  (Asignaturas (nombre Fundamentos_Ingenieria_Softwate) (rama obligatoria) (curso 2) (cuatrimestre 2) (dificultad facil))
  (Asignaturas (nombre Ingenieria_Artifical) (rama obligatoria) (curso 2) (cuatrimestre 2) (dificultad normal))
  ;Asignaturass tercero
  (Asignaturas (nombre Informatica_Grafica) (rama obligatoria) (curso 3) (cuatrimestre 1) (dificultad normal))
  (Asignaturas (nombre Disenio_Desarrollo_Sistemas_Informacion) (rama obligatoria) (curso 3) (cuatrimestre 1) (dificultad facil))
  (Asignaturas (nombre Modelos_Computacion) (rama obligatoria) (curso 3) (cuatrimestre 1) (dificultad facil))
  (Asignaturas (nombre Fundamentos_Redes) (rama obligatoria) (curso 3) (cuatrimestre 1) (dificultad dificil))
  (Asignaturas (nombre Ingenieria_Servidores) (rama obligatoria) (curso 3) (cuatrimestre 1) (dificultad dificil))
  (Asignaturas (nombre Aprendizaje_Automatico) (rama CSI) (curso 3) (cuatrimestre 2) (dificultad dificil))
  (Asignaturas (nombre Ingenieria_Conocimiento) (rama CSI) (curso 3) (cuatrimestre 2) (dificultad normal))
  (Asignaturas (nombre Metaheuristicas) (rama CSI) (curso 3) (cuatrimestre 2) (dificultad facil))
  (Asignaturas (nombre Modelos_Avanzados_Computacion) (rama CSI) (curso 3) (cuatrimestre 2) (dificultad normal))
  (Asignaturas (nombre Tecnicas_Sistemas_Inteligentes) (rama CSI) (curso 3) (cuatrimestre 2) (dificultad facil))
  (Asignaturas (nombre Desarrollo_Sistemas_Distribuidos) (rama IS) (curso 3) (cuatrimestre 2) (dificultad facil))
  (Asignaturas (nombre Desarrollo_Software) (rama IS) (curso 3) (cuatrimestre 2) (dificultad normal))
  (Asignaturas (nombre Disenio_Interfaces_Usuario) (rama IS) (curso 3) (cuatrimestre 2) (dificultad dificil))
  (Asignaturas (nombre Sistemas_Informacion_Basados_Web) (rama IS) (curso 3) (cuatrimestre 2) (dificultad facil))
  (Asignaturas (nombre Sistemas_Graficos) (rama IS) (curso 3) (cuatrimestre 2) (dificultad dificil))
  (Asignaturas (nombre Arquitectura_Sistemas) (rama IC) (curso 3) (cuatrimestre 2) (dificultad normal))
  (Asignaturas (nombre Arquitecturas_Computacion_Altas_Prestaciones) (rama IC) (curso 3) (cuatrimestre 2) (dificultad facil))
  (Asignaturas (nombre Desarrollo_Hardware_Digital) (rama IC) (curso 3) (cuatrimestre 2) (dificultad facil))
  (Asignaturas (nombre Disenio_Sistemas_Electronicos) (rama IC) (curso 3) (cuatrimestre 2) (dificultad dificil))
  (Asignaturas (nombre Sistemas_Microprocesadores) (rama IC) (curso 3) (cuatrimestre 2) (dificultad dificil))
  (Asignaturas (nombre Administracion_Bases_Datos) (rama SI) (curso 3) (cuatrimestre 2) (dificultad normal))
  (Asignaturas (nombre Ingenieria_Sistemas_Informacion) (rama SI) (curso 3) (cuatrimestre 2) (dificultad facil))
  (Asignaturas (nombre Programacion_Web) (rama SI) (curso 3) (cuatrimestre 2) (dificultad dificil))
  (Asignaturas (nombre Sistemas_Informacion_Empresas) (rama SI) (curso 3) (cuatrimestre 2) (dificultad facil))
  (Asignaturas (nombre Sistemas_Multidimensionales) (rama SI) (curso 3) (cuatrimestre 2) (dificultad normal))
  (Asignaturas (nombre Computacion_Ubicua_Inteligencia_Artificial) (rama TI) (curso 3) (cuatrimestre 2) (dificultad dificil))
  (Asignaturas (nombre Servidores_Web_Altas_Prestaciones) (rama TI) (curso 3) (cuatrimestre 2) (dificultad normal))
  (Asignaturas (nombre Sistemas_Multimedia) (rama TI) (curso 3) (cuatrimestre 2) (dificultad normal))
  (Asignaturas (nombre Tecnologias_Web) (rama TI) (curso 3) (cuatrimestre 2) (dificultad dificil))
  (Asignaturas (nombre Transmision_Datos_Redes_Computadores) (rama TI) (curso 3) (cuatrimestre 2) (dificultad dificil))
  ;Asignaturass cuarto
  (Asignaturas (nombre Nuevos_Paradigmas_Interaccion) (rama CSI) (curso 4) (cuatrimestre 1) (dificultad normal) )
  (Asignaturas (nombre Procesadores_Lenguajes) (rama CSI) (curso 4) (cuatrimestre 1) (dificultad normal) )
  (Asignaturas (nombre Vision_Computador) (rama CSI) (curso 4) (cuatrimestre 1) (dificultad dificil) )
  (Asignaturas (nombre Direccion_Gestion_Proyectos) (rama IS) (curso 4) (cuatrimestre 1) (dificultad facil) )
  (Asignaturas (nombre Metodologias_Desarrollo_Agiles) (rama IS) (curso 4) (cuatrimestre 1) (dificultad normal) )
  (Asignaturas (nombre Especialidad_Ingenieria_computadores) (rama IS) (curso 4) (cuatrimestre 1) (dificultad normal) )
  (Asignaturas (nombre Centros_Procesamiento_Datos) (rama IC) (curso 4) (cuatrimestre 1) (dificultad normal) )
  (Asignaturas (nombre Sistemas_Empotrados) (rama IC) (curso 4) (cuatrimestre 1) (dificultad dificil) )
  (Asignaturas (nombre Tecnologias_Red) (rama IC) (curso 4) (cuatrimestre 1) (dificultad normal) )
  (Asignaturas (nombre Bases_Datos_Distribuidas) (rama SI) (curso 4) (cuatrimestre 1) (dificultad facil) )
  (Asignaturas (nombre Inteligencia_Negocio) (rama SI) (curso 4) (cuatrimestre 1) (dificultad facil) )
  (Asignaturas (nombre Recuperacion_Informacion) (rama SI) (curso 4) (cuatrimestre 1) (dificultad normal) )
  (Asignaturas (nombre Desarrollo_Aplicaciones_Internet) (rama TI) (curso 4) (cuatrimestre 1) (dificultad facil) )
  (Asignaturas (nombre Infraestructura_Virtual) (rama TI) (curso 4) (cuatrimestre 1) (dificultad dificil) )
  (Asignaturas (nombre Seguridad_Proteccion_Sistemas_Informaticos) (rama TI) (curso 4) (cuatrimestre 1) (dificultad dificil) )
  (Asignaturas (nombre Programacion_Tecnica_Cientifica) (rama CSI) (curso 4) (cuatrimestre 1) (dificultad normal) )
  (Asignaturas (nombre Simulacion_Sistemas) (rama CSI) (curso 4) (cuatrimestre 1) (dificultad dificil) )
  (Asignaturas (nombre Teoria_Informacion_Codificacion) (rama CSI) (curso 4) (cuatrimestre 1) (dificultad dificil) )
  (Asignaturas (nombre Logica_Programacion) (rama IS) (curso 4) (cuatrimestre 1) (dificultad normal) )
  (Asignaturas (nombre Programacion_Grafica_Videojuegos) (rama IS) (curso 4) (cuatrimestre 1) (dificultad facil) )
  (Asignaturas (nombre Seguridad_Sistemas_Operativos) (rama IS) (curso 4) (cuatrimestre 1) (dificultad normal) )
  (Asignaturas (nombre Tecnologias_Emergentes) (rama IC) (curso 4) (cuatrimestre 1) (dificultad normal) )
  (Asignaturas (nombre Informatica_Industrial) (rama IC) (curso 4) (cuatrimestre 1) (dificultad facil) )
  (Asignaturas (nombre Sistemas_Informacion_Geograficos) (rama SI) (curso 4) (cuatrimestre 1) (dificultad normal) )
  (Asignaturas (nombre Gestion_Recursos_Digitales) (rama SI) (curso 4) (cuatrimestre 1) (dificultad facil) )
  (Asignaturas (nombre Redes_Sistemas_Complejos) (rama SI) (curso 4) (cuatrimestre 1) (dificultad facil) )
  (Asignaturas (nombre Compresion_Recuperacion_Informacion_Multimedia) (rama TI) (curso 4) (cuatrimestre 1) (dificultad dificil) )
  (Asignaturas (nombre Tratamiento_Imagenes_Digitales) (rama TI) (curso 4) (cuatrimestre 1) (dificultad normal) )
  (Asignaturas (nombre Practicas_Empresa) (rama troncal) (curso 4) (cuatrimestre 2) (dificultad facil) )
  (Asignaturas (nombre Proyecto_Fin_Grado) (rama troncal) (curso 4) (cuatrimestre 2) (dificultad normal) )
  (Asignaturas (nombre Criptografia_Computacion) (rama CSI) (curso 4) (cuatrimestre 2) (dificultad dificil) )
  (Asignaturas (nombre Programacion_Ludica) (rama CSI) (curso 4) (cuatrimestre 2) (dificultad facil) )
  (Asignaturas (nombre Robotica_Industrial) (rama CSI) (curso 4) (cuatrimestre 2) (dificultad normal) )
  (Asignaturas (nombre Animacion_por_Ordenador) (rama IS) (curso 4) (cuatrimestre 2) (dificultad normal) )
  (Asignaturas (nombre Nuevas_Tecnicas_Programacion) (rama IS) (curso 4) (cuatrimestre 2) (dificultad facil) )
  (Asignaturas (nombre Programacion_Paralela) (rama IS) (curso 4) (cuatrimestre 2) (dificultad normal) )
  (Asignaturas (nombre Circuitos_Integrados_Impresos) (rama IC) (curso 4) (cuatrimestre 2) (dificultad normal) )
  (Asignaturas (nombre Mantenimiento_Equipos_Informaticos) (rama IC) (curso 4) (cuatrimestre 2) (dificultad facil) )
  (Asignaturas (nombre Perifericos_Dispositivos_Interfaz_Humana) (rama SI) (curso 4) (cuatrimestre 2) (dificultad normal) )
  (Asignaturas (nombre Sistemas_Cooperativos_Gestion_Contenidos) (rama SI) (curso 4) (cuatrimestre 2) (dificultad facil) )
  (Asignaturas (nombre Procesamiento_Digital_Seniales) (rama TI) (curso 4) (cuatrimestre 2) (dificultad dificil) )
  (Asignaturas (nombre Programacion_Dispositivos_Moviles) (rama TI) (curso 4) (cuatrimestre 2) (dificultad normal) )
  (Asignaturas (nombre Redes_Multiservicio) (rama TI) (curso 4) (cuatrimestre 2) (dificultad normal) )
)

;; Preguntas de las asignaturas

(defrule pregunta1
  (declare (salience 10))
  (Modulo (nombre asignaturas))
  =>
  (printout t "Dime el nombre de la primera asignatura" crlf)
  (assert (primera (read)))
)

(defrule pregunta1_check
  (declare (salience 100))
  (Modulo (nombre asignaturas))
  ?f<-(primera ?p)
  (not (Asignaturas (nombre ?p) (rama ?r) (cuatrimestre ?c) (dificultad ?d)))
  =>
  (printout t "Asignatura no valida, dime el nombre de la primera asignatura" crlf)
  (retract ?f)
  (assert (primera (read)))
)

(defrule pregunta2
  (declare (salience 10))
  (Modulo (nombre asignaturas))
  =>
  (printout t "Dime el nombre de la segunda asignatura" crlf)
  (assert (segunda (read)))
)

(defrule pregunta2_check
  (declare (salience 100))
  (Modulo (nombre asignaturas))
  (primera ?p)
  ?f<-(segunda ?s)
  (not (Asignaturas (nombre ?s) (rama ?r) (cuatrimestre ?c) (dificultad ?d)))
  =>
  (printout t "Asignatura no valida, dime el nombre de la segunda asignatura" crlf)
  (retract ?f)
  (assert (segunda (read)))
)

(defrule pregunta3
  (declare (salience 10))
  (Modulo (nombre asignaturas))
  (primera ?p)
  (segunda ?s)
  (rama distinto)
  (cuatrimestre igual)
  (Asignaturas (nombre ?p) (rama ?r1) (curso ?cr1) (cuatrimestre ?c1) (dificultad ?d1))
  (Asignaturas (nombre ?s) (rama ?r2) (curso ?cr2) (cuatrimestre ?c2) (dificultad ?d2))
  (test (and (neq ?cr1 1) (neq ?cr1 2) (neq ?cr2 1) (neq ?cr2 2)))
  (test (and (neq ?r1 obligatoria) (neq ?r2 obligatoria)))
  =>
  (bind ?r null)
  (while (and (neq ?r ?r1) (neq ?r ?r2) (neq ?r indiferente))
    (printout t "¿Te gusta mas la rama " ?r1 " o " ?r2 " o te es indiferente?" crlf)
    (bind ?r (read))
  )
  (assert (tercera ?r))
)

(defrule iguales
  (declare (salience 11))
  (Modulo (nombre asignaturas))
  (primera ?p)
  ?f <- (segunda ?s)
  (test (eq ?p ?s))
  =>
  (printout t "Las asignaturas no pueden ser la misma, dime la segunda asignatura" crlf)
  (retract ?f)
  (assert (segunda (read)))
)

; Reglas para el razonamiento
(defrule asignatura_por_defecto
  (declare (salience -1))
  (Modulo (nombre asignaturas))
  (primera ?p)
  (segunda ?s)
  =>
  (assert (eleccion ?p ?s por_defecto))
  (bind ?exp (str-cat " " ?p " porque no tengo datos suficientes para aconsejarte"))
  (assert (explicacion ?p ?s ?exp))
)

(defrule retracta_asignatura_por_defecto
  (Modulo (nombre asignaturas))
  (primera ?p)
  (segunda ?s)
  (nueva_exp ?exp)
  ?g<-(explicacion ?p ?s ?x)
  ?f<-(eleccion ?p ?s por_defecto)
  (test (neq ?exp ""))
  =>
  (retract ?f ?g)
  (assert (explicacion ?p ?s ?exp))
)

(defrule comprobar_flags
  (Modulo (nombre asignaturas))
  (primera ?p)
  (segunda ?s)
  (Asignaturas (nombre ?p) (rama ?r1) (curso ?cr1) (cuatrimestre ?c1) (dificultad ?d1))
  (Asignaturas (nombre ?s) (rama ?r2) (curso ?cr2) (cuatrimestre ?c2) (dificultad ?d2))
  =>
  (if (eq ?r1 ?r2) then (assert (rama igual))
  else (assert (rama distinto)))
  (if (eq ?cr1 ?cr2) then (assert (curso igual))
  else (assert (curso distinto)))
  (if (eq ?c1 ?c2) then (assert (cuatrimestre igual))
  else (assert (cuatrimestre distinto)))
  (if (eq ?d1 ?d2) then (assert (dificultad igual))
  else (assert (dificultad distinto)))
  (assert (c_defecto si))
)

(defrule distinto_cuatrimestre
  (Modulo (nombre asignaturas))
  (cuatrimestre distinto)
  (primera ?p)
  (segunda ?s)
  (Asignaturas (nombre ?p) (rama ?r1) (curso ?cr1) (cuatrimestre ?c1) (dificultad ?d1))
  (Asignaturas (nombre ?s) (rama ?r2) (curso ?cr2) (cuatrimestre ?c2) (dificultad ?d2))
  =>
  (bind ?exp " las dos puesto que son de distinto cuatrimestre")

  (if (or (eq ?p Practicas_Empresa) (eq ?s Practicas_Empresa)) then
    (bind ?exp " las dos siempre y cuando hayas completado el 50% de la carrera y no hayas hecho Practicas_Empresa antes")
  )

  (if (and (eq ?cr1 1) (eq ?s Proyecto_Fin_Grado)) then
    (bind ?exp (str-cat " " ?p " porque es de primero y no puedes hacer " ?s))
  )

  (if (and (eq ?cr2 1) (eq ?p Proyecto_Fin_Grado)) then
    (bind ?exp (str-cat " " ?s " porque es de primero y no puedes hacer " ?p))
  )

  (if (and (neq ?cr1 1) (neq ?cr2 1) (or (eq ?p Proyecto_Fin_Grado) (eq ?s Proyecto_Fin_Grado))) then
    (bind ?exp " las dos si puedes matricularte de todos tus creditos restantes")
  )

  (assert (eleccion ?p ?s seguro))
  (assert (nueva_exp ?exp))
)

(defrule rama_x
  (Modulo (nombre asignaturas))
  (primera ?p)
  (segunda ?s)
  (tercera ?t)
  ?f<-(c_defecto si)
  (Asignaturas (nombre ?p) (rama ?r1) (curso ?cr1) (cuatrimestre ?c1) (dificultad ?d1))
  (Asignaturas (nombre ?s) (rama ?r2) (curso ?cr2) (cuatrimestre ?c2) (dificultad ?d2))
  =>
  (bind ?exp "")
  (if (eq ?t ?r1) then
    (bind ?exp (str-cat " " ?p " porque la rama " ?r1 " te gusta mas"))
    else (if (eq ?t ?r2) then
      (bind ?exp (str-cat " " ?s " porque la rama " ?r2 " te gusta mas"))
    )
  )
  (if (neq ?t indiferente) then
    (and
      (retract ?f)
      (assert (c_defecto no))
    )
  )

  (assert (eleccion ?p ?s seguro))
  (assert (nueva_exp ?exp))
)

(defrule curso_x
  (Modulo (nombre asignaturas))
  (curso distinto)
  (cuatrimestre igual)
  (c_defecto si)
  (primera ?p)
  (segunda ?s)
  (Asignaturas (nombre ?p) (rama ?r1) (curso ?cr1) (cuatrimestre ?c1) (dificultad ?d1))
  (Asignaturas (nombre ?s) (rama ?r2) (curso ?cr2) (cuatrimestre ?c2) (dificultad ?d2))
  =>
  (bind ?exp "")

  (if (or (eq ?p Practicas_Empresa) (eq ?s Practicas_Empresa)) then
    (bind ?exp " las dos siempre y cuando hayas completado el 50% de la carrera y no hayas hecho Practicas_Empresa antes")
  )

  (if (< ?cr1 ?cr2) then
    (bind ?exp (str-cat " " ?p " puesto que es de un curso inferior"))
  )

  (if (< ?cr2 ?cr1) then
    (bind ?exp (str-cat " " ?s " puesto que es de un curso inferior"))
  )

  (if (and (eq ?p Proyecto_Fin_Grado) (eq ?cr2 1)) then
    (bind ?exp (str-cat " " ?s " porque es de primero y no puedes hacer " ?p))
  )

  (if (and (eq ?s Proyecto_Fin_Grado) (eq ?cr1 1)) then
    (bind ?exp (str-cat " " ?p " porque es de primero y no puedes hacer " ?s))
  )

  (if (and (neq ?cr1 1) (neq ?cr2 1) (or (eq ?p Proyecto_Fin_Grado) (eq ?s Proyecto_Fin_Grado))) then
    (bind ?exp " las dos si puedes matricularte de todos tus creditos restantes")
  )

  (assert (eleccion ?p ?s seguro))
  (assert (nueva_exp ?exp))
)

(defrule dificultad_x
  (Modulo (nombre asignaturas))
  (curso igual)
  (cuatrimestre igual)
  (dificultad ?d)
  (primera ?p)
  (segunda ?s)
  (Asignaturas (nombre ?p) (rama ?r1) (curso ?cr1) (cuatrimestre ?c1) (dificultad ?d1))
  (Asignaturas (nombre ?s) (rama ?r2) (curso ?cr2) (cuatrimestre ?c2) (dificultad ?d2))
  =>
  (bind ?exp "")

  (if (eq ?d igual) then
    (bind ?exp (str-cat " " ?p " o " ?s " porque tienen dificultad similar "))
  )

  (if (and (eq ?d1 facil) (or (eq ?d2 normal) (eq ?d2 dificil))) then
    (bind ?exp (str-cat " " ?p " puesto que es mas sencilla "))
  )

  (if (and (eq ?d1 normal) (eq ?d2 dificil)) then
    (bind ?exp (str-cat " " ?p " puesto que es mas sencilla "))
  )

  (if (and (eq ?d2 facil) (or (eq ?d1 normal) (eq ?d1 dificil))) then
    (bind ?exp (str-cat " " ?s " puesto que es mas sencilla "))
  )

  (if (and (eq ?d2 normal) (eq ?d1 dificil)) then
    (bind ?exp (str-cat " " ?s " puesto que es mas sencilla "))
  )

  (assert (eleccion ?p ?s seguro))
  (assert (nueva_exp ?exp))
)

(defrule imprime
  (Modulo (nombre asignaturas))
  (primera ?p)
  (segunda ?s)
  (explicacion ?p ?s ?exp)
  =>
  (printout t "Entre " ?p " y " ?s " elegimos" ?exp crlf)
)
