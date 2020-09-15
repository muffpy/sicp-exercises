#lang racket

; recursive
(define (accumulate combiner null-value term a next b) 
  (if (> a b) null-value 
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))


;iterative
(define (accumulator combiner null-value term a next b) 
  (define (iter a res) 
    (if (> a b) res 
        (iter (next a) (combiner res (term a))))) 
  (iter a null-value)) 

; iteratuve filter+accumulator+comb
(define (filtered-accumulate combiner null-value term a next b filter) 
  (define (iter a result) 
    (cond ((> a b) result) 
          ((filter a) (iter (next a) (combiner result (term a)))) 
          (else (iter (next a) result)))) 
  (iter a null-value))

; primality (fermat) test
(define (sq x) (* x x))
(define (smallest-div n) 
  (define (divides? a b) 
    (= 0 (remainder b a))) 
  (define (find-div n test) 
    (cond ((> (sq test) n) n) ((divides? test n) test) 
          (else (find-div n (+ test 1))))) 
  (find-div n 2)) 
  
(define (prime? n) 
  (if (= n 1) false (= n (smallest-div n))))

(define (inc n) (+ n 1))
(define (sum-of-prime-squares a b) (filtered-accumulate + 0 sq a inc b prime?)) 
