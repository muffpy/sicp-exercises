#lang racket

(define (last-pair l)
  (cond ((null? l) l)
        ((null? (cdr l)) (list(car l)))
        (else (last-pair (cdr l)))))

;; test cases
(last-pair (list 23 72 149 34)) ;;= (34) 
(last-pair '()) ;;= () 