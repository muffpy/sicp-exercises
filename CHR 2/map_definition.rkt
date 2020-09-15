#lang racket

;; map function that takes a procedure (with one argument) and a list
;; and applies the proc to all the 'items'

(define (map proc items)
  (if (null? items)
      items
      (cons (proc (car items))
            (map proc (cdr items)))))
(map (lambda (x) (* x x)) (list 1 2 3 4))

;; abstract the scaling factor out
(define (scale-list items factor)
(map (lambda (x) (* x factor))
items))
