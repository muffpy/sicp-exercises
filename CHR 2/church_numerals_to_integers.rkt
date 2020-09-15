#lang racket
(define to_real_number
  (lambda (n)
    ((n (lambda (x) (+ x 1))) 0)))
