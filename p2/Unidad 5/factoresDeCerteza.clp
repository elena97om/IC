;;;;;;;         ELENA ORTIZ MORENO      INGENIERÍA DEL CONOCIMIENTO UGR UNIDAD 5     2021           ;;;;;;;
;;;;;;; Dadas unas evidencias, deducir qué problemas puede tener el funcionamiento de un coche      ;;;;;;;

; (FactorCerteza ?h si|no ?f) representa que ?h se ha deducido con factor de certeza ?f
;?h podrá_ser:
;- problema_starter
;- problema_bujias
;- problema_batería
;- motor_llega_gasolina
; (Evidencia ?e si|no) representa el hecho de si evidencia ?e se da
; ?e podrá ser:
;- hace_intentos_arrancar
;- hay_gasolina_en_deposito
;- encienden_las_luces
;- gira_motor

;;; convertimos cada evidencia en una afirmación sobre su factor de certeza
(defrule certeza_evidencias
  (Evidencia ?e ?r)
  =>
  (assert (FactorCerteza ?e ?r 1))
  )
;; También podríamos considerar evidencias con una cierta
;;incertidumbre: al preguntar por la evidencia, pedir y recoger
;;directamente el grado de certeza

(deffunction encadenado (?fc_antecedente ?fc_regla)
  (if (> ?fc_antecedente 0)
    then
      (bind ?rv (* ?fc_antecedente ?fc_regla))
    else
      (bind ?rv 0) )
  ?rv)



;R1: SI el motor obtiene gasolina Y el motor gira ENTONCES problemas ;
;con las bujías con certeza 0.7
(defrule R1
  (FactorCerteza motor_llega_gasolina si ?f1)
  (FactorCerteza gira_motor si ?f2)
  (test (and (> ?f1 0) (> ?f2 0)))
  =>
  (assert (FartorCerteza problema_bujias si (encadenado (* ?f1 ?f2) 0.7))))

;R2: SI NO gira el motor ENTONCES problema con el starter
;con certeza 0.8
;(defrule R2
;  (Evidencia gira_motor no)
;  =>
;  (assert (FactorCerteza problema_starter si (* ?f1 0.8)))
;  )

(defrule R2
  (declare (salience 10))
  (Evidencia gira_motor no)
  =>
  (assert (FactorCerteza problema_starter si 0.8))
  )

;R3: SI NO encienden las luces ENTONCES problemas
;con la batería con certeza 0.9
(defrule R3
  (declare (salience 10))
  (Evidencia encienden_las_luces no)
  =>
  (assert (FactorCerteza problema_batería si 0.9))
  )


;R4: SI hay gasolina en el deposito ENTONCES el motor
;obtiene gasolina con certeza 0.9
(defrule R4
  (declare (salience 10))
  (Evidencia hay_gasolina_en_deposito si)
  =>
  (assert (FactorCerteza motor_llega_gasolina si 0.9))
  )

;R5: SI hace intentos de arrancar ENTONCES problema
;con el starter con certeza -0.6
(defrule R5
  (declare (salience 10))
  (Evidencia hace_intentos_arrancar si)
  =>
  (assert (FactorCerteza problema_starter si -0.6))
  )

;R6: SI hace intentos de arrancar ENTONCES
;problema con la batería 0.5
(defrule R6
  (declare (salience 10))
  (Evidencia hace_intentos_arrancar si)
  =>
  (assert (FactorCerteza problema_batería si 0.5))
  )

  (deffunction combinacion (?fc1 ?fc2)
  (if (and (> ?fc1 0) (> ?fc2 0) )
    then
      (bind ?rv (- (+ ?fc1 ?fc2) (* ?fc1 ?fc2) ) )
    else
      (if (and (< ?fc1 0) (< ?fc2 0) )
        then
          (bind ?rv (+ (+ ?fc1 ?fc2) (* ?fc1 ?fc2) ) )
        else
          (bind ?rv (/ (+ ?fc1 ?fc2) (- 1 (min (abs ?fc1) (abs ?fc2))) ))
      )
  ) ?rv)

;;;;;; Combinar misma deduccion por distintos caminos
(defrule combinar
  (declare (salience 1))
  ?f <- (FactorCerteza ?h ?r ?fc1)
  ?g <- (FactorCerteza ?h ?r ?fc2)
  (test (neq ?fc1 ?fc2))
  =>
  (retract ?f ?g)
  (assert (FactorCerteza ?h ?r (combinacion ?fc1 ?fc2))) )

;Aunque en este ejemplo no se da, puede ocurrir que tengamos
;deducciones de hipótesis en positivo y negativo que hay que
;combinar para compararlas
(defrule combinar_signo
  (declare (salience 2))
  (FactorCerteza ?h si ?fc1)
  (FactorCerteza ?h no ?fc2)
  =>
  (assert (Certeza ?h (- ?fc1 ?fc2)))
  )


(defrule pregunta_hace_intentos_arrancar
  (declare (salience 100))
  =>
  (printout t "¿Hace instentos de arrancar?" crlf)
  (bind ?s (read))
  (while (and (neq ?s si) (neq ?s no))
    (printout t "¿si o no?" crlf)
    (bind ?s (read))
  )
  (assert (Evidencia hace_intentos_arrancar ?s))
)

(defrule pregunta_hay_gasolina_en_deposito
  (declare (salience 100))
  =>
  (printout t "¿Hay gasolina en el deposito?" crlf)
  (bind ?s (read))
  (while (and (neq ?s si) (neq ?s no))
    (printout t "¿si o no?" crlf)
    (bind ?s (read))
  )
  (assert (Evidencia hay_gasolina_en_deposito ?s))
)

(defrule pregunta_encienden_las_luces
  (declare (salience 100))
  =>
  (printout t "¿Encienden las luces?" crlf)
  (bind ?s (read))
  (while (and (neq ?s si) (neq ?s no))
    (printout t "¿si o no?" crlf)
    (bind ?s (read))
  )
  (assert (Evidencia encienden_las_luces ?s))
)

(defrule pregunta_gira_motor
  (declare (salience 100))
  =>
  (printout t "¿Gira el motor?" crlf)
  (bind ?s (read))
  (while (and (neq ?s si) (neq ?s no))
    (printout t "¿si o no?" crlf)
    (bind ?s (read))
  )
  (assert (Evidencia gira_motor ?s))
)

(defrule quitar_evidencias
  ?f<-(FactorCerteza ?h ?x ?fc)
  ?e<-(Evidencia ?h ?s)
  =>
  (retract ?f ?e)
)

(defrule comparar
  ?f1<-(FactorCerteza ?h1 ?x ?fc1)
  ?f2<-(FactorCerteza ?h2 ?y ?fc2)
  (test (neq ?h1 ?h2))
  =>
  (if (< ?fc1 ?fc2) then
    (retract ?f1)
  )
  (if (> ?fc1 ?fc2) then
    (retract ?f2)
  )
)

(defrule imprimeFactorCerteza
  (FactorCerteza ?h ?x ?fc)
  =>
  (printout t ?h " con certeza " ?fc crlf)
  )
