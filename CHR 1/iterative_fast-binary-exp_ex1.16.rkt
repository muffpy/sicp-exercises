;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname iterative_fast-binary-exp_ex1.16) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (square x) (* x x))
(define (iter-fast-expt b n)
  (iter n b 1))

(define (iter N B A) 
  (cond ((= 0 N) A) 
        ((even? N) (iter (/ N 2) (square B) A)) 
        (else (iter (- N 1) B (* B A))))) 

;; base case : a = 1
;; invariant : product a*(b^n) remians unchanged
;; state transformation = a * b where b(i) = (b(i-1))^2 when N % 2 = 0
;; return A