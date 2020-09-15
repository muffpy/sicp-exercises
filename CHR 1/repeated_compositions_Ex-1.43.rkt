#lang racket

(define (square x) (* x x)) 
(define (compose f g) (lambda (x) (f (g x))))

(define (repeat f n) 
  (if (< n 1) 
      (lambda(x) x) ; identity function
      (compose f (repeat f (- n 1))))) 

;A solution with O(log n) complexity using compose:
(define (repeated f n) 
  (cond ((= n 0) identity) 
        ((even? n) (repeated (compose f f) (/ n 2))) 
        (else (compose f (repeated f (- n 1)))))) 