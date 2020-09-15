#lang racket

;; I := λa.a
(define I 
  (lambda (a) a))

;; M := λf.ff
(define M
  (lambda (f) (f f)))

;; K := λab.a
(define K
  (lambda (a)
    (lambda (b) a)))

;; KI := λab.b
(define KI
  (lambda (a)
    (lambda (b) b)))

;; C := λfab.fba
(define C
  (lambda (f)
    (lambda (a)
      (lambda (b) ((f b) a)))))

;; booleans expressed as CHOOSING between two expressions
;; result := func ? exp1:exp2
;; so a function (func) chooses exp1 is true and exp2 if false
;; Idea: use K and KI!

;; TRUE := K
(define T K)
;; FALSE := KI
(define F KI)

;; NOT := λp.pFT - select opposite of p 
(define NOT
  (lambda(p) ((p F) T)))

;; Alternate NOT using C
;; Since C K = KI and C KI = K
;; or C T = F and C F = T
(define NOT-2
  (lambda (p) (C p)))

;; AND := λpq.pqp
;; If p is true, AND evals to true only if q is true, if p is false,
;; it can only be false (itself)
(define AND
  (lambda (p)
    (lambda (q) ((p q) p))))
;;; tests
;((AND T) T)
;((AND T) F)
;((AND F) T)
;((AND F) F)

;; OR := λpq.ppq
(define OR
  (lambda (p)
    (lambda (q) ((p p) q))))
; Observe similarity to M by applying OR to two arguments
; (λpq.ppq)xy = xxy (beta-reduction) and Mxy = xxy !!

;; BOOLEAN EQUALITY := λpq.p(q T F)(q F T)
;; can be simplified because if q(left) just selects itself and
;; q(right) selects opposite which is just NOT!

;; BEQ := λpq.pq(NOT(q))
(define BEQ
  (lambda(p)
    (lambda(q)
      ((p q) (NOT q))
      )
    )
  )

;; tests
;((BEQ T) T)
;((BEQ T) F)
;((BEQ F) T)
;((BEQ F) F)





