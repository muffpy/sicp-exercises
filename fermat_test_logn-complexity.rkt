;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname fermat_test_logn-complexity) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (square x) (* x x)) 
  
(define (expmod base exp m) 
  (cond ((= exp 0) 1) 
        ((even? exp) 
         (remainder (square (expmod base (/ exp 2) m)) 
                    m)) 
        (else 
         (remainder (* base (expmod base (- exp 1) m)) 
                    m))))         
  
(define (fermat-test n)  
  (try-it (+ 1 (random (- n 1))) n))

(define (try-it a n) 
    (= (expmod a n n) a))
  
(define (fast-prime? n times) 
  (cond ((= times 0) true) 
        ((fermat-test n) (fast-prime? n (- times 1))) 
        (else false))) 
  
(define (prime? n) 
  ; Perform the test how many times? 
  ; Use 100 as an arbitrary value. 
  (fast-prime? n 100)) 
