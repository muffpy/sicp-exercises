;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname cubert_improvedprecision) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (cube-root-iter guess x) 
              (if (good-enough? guess x) 
                   guess 
                   (cube-root-iter (improve guess x) x))) 
  
 (define (improve guess x) 
               (average (/ x (square guess)) (* 2 guess))) 
  
 (define (average x y) 
              (/ (+ x y) 3)) 
                  
 (define (square x) (* x x)) 
  
 (define (good-enough? guess x) 
              (< (abs (- (cube guess) x)) (* guess 0.001))) 
  
 (define (cube x) (* x x x)) 
  
 (define (cubert x)  
              (if (< x 0)  
                   (* -1 (cube-root-iter 1.0 (abs x)))  
                   (cube-root-iter 1.0 x))) 