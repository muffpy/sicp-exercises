#lang racket

(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (if (good-enough? guess)
        guess
        (iterative-improve good-enough? improve)) (improve guess)))


;; alternative where iterative-improve not called inside itself, an inner procedure to
;; improve guess is used instead

(define (iterative-improve-2 good-enough? improve)
  (lambda (first-guess)
    (define (iter guess)
      (if (good-enough? guess)
          guess
          (iter (improve guess))))
    (iter first-guess)))

;; example
(define (square x) (* x x))
  
(define (average x y) 
  (/ (+ x y) 2.0))

(define (sqrt x) 
  ((iterative-improve 
    (lambda (y) 
      (< (abs (- (square y) x)) 
         0.0001)) 
    (lambda (y) 
      (average y (/ x y)))) 
   1.0)) 