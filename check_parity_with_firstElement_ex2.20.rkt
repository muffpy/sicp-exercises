#lang racket
(define nil '())
(define (same-parity first . rest)
  (define (iter items result)
    (if (null? items)
        result ;; reverse the elemnts to get correct order
        (if (= (remainder (car items) 2) (remainder first 2))
            (iter (cdr items) (cons (car items) result))
            (iter (cdr items) result))))
  (iter rest (list first)))

(define (square x) (* x x))
(square 2)

(define (for-each proc items) 
  (cond ((not (null? items)) 
         (proc (car items)) 
         (for-each proc (cdr items)))))

(for-each (lambda(x) (newline) (display x)) (list 1 2 3 4))