;;;;;;;         ELENA ORTIZ MORENO      INGENIERÍA DEL CONOCIMIENTO UGR EJERCICIO 1      25/04/21           ;;;;;;;
;;;;;;; Preguntar sobre las personas relacionadas de una manera concreta con una persona concreta de la familia  ;;;;;;;

;;;;;; FORMA DE PREGUNTAR:
;;;;;; Dime el nombre:  LindaMcFly
;;;;;; Dime la relacion: ABUELOS

;Familia McFly de Regreso al Futuro
(deffacts personas
   (hombre SeamusMcFly)
   (hombre MartinMcFly)
   (hombre WilliamSeanMcFly)
   (hombre ArthurMcFly)
   (hombre GeorgeMcFly)
   (hombre DavidMcFly)
   (hombre MartyMcFly)
   (hombre MartyMcFlyJr)
   (hombre SamBaines)
   (hombre TobyBaines)
   (hombre JoeyBaines)
   (hombre MiltonBaines)
   (mujer MaggieMcFly)
   (mujer SylviaMcFly)
   (mujer LindaMcFly)
   (mujer LorraineBaines)
   (mujer StellaBaines)
   (mujer SallyBaines)
   (mujer JenniferParker)
   (mujer MarleneMcFly) )

(deftemplate Relacion
  (slot tipo (type SYMBOL) (allowed-symbols HIJO PADRE ABUELO NIETO HERMANO ESPOSO PRIMO TIO SOBRINO CUNIADO YERNO SUEGRO))
  (slot sujeto)
  (slot objeto))

(deffacts plural
  (plural HIJO HIJOS) (plural PADRE PADRES) (plural ABUELO ABUELOS) (plural NIETO NIETOS) (plural HERMANO HERMANOS) (plural PRIMO PRIMOS) (plural TIO TIOS) (plural SOBRINO SOBRINOS) (plural CUNIADO CUNIADOS) (plural YERNO YERNOS) (plural SUEGRO SUEGROS))

(deffacts relaciones
   (Relacion (tipo HIJO) (sujeto WilliamSeanMcFly) (objeto SeamusMcFly))
   (Relacion (tipo HIJO) (sujeto ArthurMcFly) (objeto WilliamSeanMcFly))
   (Relacion (tipo HIJO) (sujeto GeorgeMcFly) (objeto ArthurMcFly))
   (Relacion (tipo HIJO) (sujeto DavidMcFly) (objeto GeorgeMcFly))
   (Relacion (tipo HIJO) (sujeto LindaMcFly) (objeto GeorgeMcFly))
   (Relacion (tipo HIJO) (sujeto MartyMcFly) (objeto GeorgeMcFly))
   (Relacion (tipo HIJO) (sujeto LorraineBaines) (objeto SamBaines))
   (Relacion (tipo HIJO) (sujeto MiltonBaines) (objeto SamBaines))
   (Relacion (tipo HIJO) (sujeto SallyBaines) (objeto SamBaines))
   (Relacion (tipo HIJO) (sujeto TobyBaines) (objeto SamBaines))
   (Relacion (tipo HIJO) (sujeto JoeyBaines) (objeto SamBaines))
   (Relacion (tipo HIJO) (sujeto MarleneMcFly) (objeto MartyMcFly))
   (Relacion (tipo HIJO) (sujeto MartyMcFlyJr) (objeto MartyMcFly))
   (Relacion (tipo ESPOSO) (sujeto SeamusMcFly) (objeto MaggieMcFly))
   (Relacion (tipo ESPOSO) (sujeto ArthurMcFly) (objeto SylviaMcFly))
   (Relacion (tipo ESPOSO) (sujeto GeorgeMcFly) (objeto LorraineBaines))
   (Relacion (tipo ESPOSO) (sujeto SamBaines) (objeto StellaBaines))
   (Relacion (tipo ESPOSO) (sujeto MartyMcFly) (objeto JenniferParker)))

 (deffacts duales
 (dual HIJO PADRE) (dual ABUELO NIETO) (dual HERMANO HERMANO)
 (dual ESPOSO ESPOSO)
 (dual PRIMO PRIMO) (dual TIO SOBRINO)
 (dual CUNIADO CUNIADO)
 (dual YERNO SUEGRO))

 (deffacts compuestos
 (comp HIJO HIJO NIETO) (comp PADRE PADRE ABUELO) (comp ESPOSO PADRE PADRE)(comp HERMANO PADRE TIO) (comp HERMANO ESPOSO CUNIADO) (comp ESPOSO HIJO YERNO) (comp ESPOSO HERMANO CUNIADO) (comp HIJO PADRE HERMANO) (comp ESPOSO CUNIADO CUNIADO) (comp ESPOSO TIO TIO)  (comp HIJO TIO PRIMO)  )

 (deffacts femenino
 (femenino HIJO HIJA) (femenino PADRE MADRE) (femenino ABUELO ABUELA) (femenino NIETO NIETA) (femenino HERMANO HERMANA) (femenino ESPOSO ESPOSA) (femenino PRIMO PRIMA) (femenino TIO TIA) (femenino SOBRINO SOBRINA) (femenino CUNIADO CUNIADA) (femenino YERNO NUERA) (femenino SUEGRO SUEGRA)
 (femenino HIJOS HIJAS) (femenino ABUELOS ABUELAS) (femenino NIETOS NIETAS) (femenino HERMANOS HERMANAS) (femenino PRIMOS PRIMAS) (femenino TIOS TIAS) (femenino SOBRINOS SOBRINAS) (femenino CUNIADOS CUNIADAS) (femenino YERNOS NUERAS) (femenino SUEGROS SUEGRAS))


 ;;;;; REGLAS DEL SISTEMA ;;;;;

(defrule autodualidad
      (dual ?r ?t)
=>
   (assert (dual ?t ?r)))


;;;; Si  x es R de y, entonces y es dualdeR de x

(defrule dualidad
   (Relacion (tipo ?r) (sujeto ?x) (objeto ?y))
   (dual ?r ?t)
=>
   (assert (Relacion (tipo ?t) (sujeto ?y) (objeto ?x))))

(defrule composicion
   (Relacion (tipo ?r) (sujeto ?y) (objeto ?x))
   (Relacion (tipo ?t) (sujeto ?x) (objeto ?z))
   (comp ?r ?t ?u)
   (test (neq ?y ?z))
=>
   (assert (Relacion (tipo ?u) (sujeto ?y) (objeto ?z))))

(defrule limpiacuniados
    (Relacion (tipo HERMANO) (sujeto ?x) (objeto ?y))
    ?f <- (Relacion (tipo CUNIADO) (sujeto ?x) (objeto ?y))
=>
	(retract ?f) )


(defrule preguntaNombre ;El sistema primero te pide el nombre de la persona por la que quieres preguntar la relación
(declare (salience 1000))
=>
   (printout t "Dime el nombre: " crlf)
   (assert (persona (read))))


(defrule preguntaRelacion ;Después te pide la relación que quieres saber del nombre introducido anteriormente
(declare (salience 100))
(persona ?primero)
=>
   (printout t "Dime la relacion: " crlf)
   (assert (relacion (read))))

;PLURAL MASCULINO
(defrule imprimePluralMasculino
  (persona ?x)
  (relacion ?p)
  (plural ?r ?p) ;paso la relación introducida en plural al singular para buscarla
  (Relacion (tipo ?r) (sujeto ?y) (objeto ?x)) ;busco la relación
  (hombre ?y) ;filtro por hombre
  =>
    (if (eq ?p PADRES) then (assert (relacion MADRE)) (assert (relacion PADRE)) ;si pregunto por padres hago que busque padre y madre
   	else (printout t ?y " es " ?r " de " ?x crlf)) ) ;si no imprimo las relaciones masculinas

;PLURAL FEMENINO
(defrule imprimePluralFemenino
  (persona ?x)
  (relacion ?p)
  (femenino ?t ?p) ;paso la relación introducida a masculino para buscarla
  (plural ?r ?t) ;paso la relación en plural al singular para buscarla
  (Relacion (tipo ?r) (sujeto ?y) (objeto ?x)) ;busco la relación
  (mujer ?y) ;filtro por mujer
  (femenino ?r ?z) ;la vuelvo a pasar a femenino
  =>
    (printout t ?y " es " ?z " de " ?x crlf) )

;MASCULINO
(defrule imprimeMasculino
  (persona ?x)
  (relacion ?r)
  (Relacion (tipo ?r) (sujeto ?y) (objeto ?x)) ;busco la relación
  (hombre ?y) ;filtro por hombre
  =>
    (printout t ?y " es " ?r " de " ?x crlf) )

;FEMENINO
(defrule imprimeFemenino
  (persona ?x)
  (relacion ?r)
  (femenino ?t ?r) ;paso la relación introducida a masculino para buscarla
  (Relacion (tipo ?t) (sujeto ?y) (objeto ?x)) ;busco la relación
  (mujer ?y) ;filtro por mujer
  =>
    (printout t ?y " es " ?r " de " ?x crlf) )
