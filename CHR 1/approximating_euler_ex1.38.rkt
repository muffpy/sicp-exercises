#lang racket

; finite continued fraction defined iteratively from inside to outside
; ,i.e, kth term determined first
(define (cont-frac n d k) 
  (define (iter x result) 
    (if (= x 0) 
        result 
        (iter (- x 1) (/ (n x) (+ (d x) result))))) 
  (iter k 0))

(define (e-euler k) 
  (+ 2.0 (cont-frac (lambda (i) 1) 
                    (lambda (i) 
                      (if (= (remainder i 3) 2) ; i mod 3 = 2
                          (/ (+ i 1) 1.5) ; observe that every multiple of 2 only at (3x - 1)th place, so rsult = ((x+1)/3)*2
                          1)) 
                    k)))




;Alternative solution to find Dk
  
; There is a repeating pattern with a cycle of 3 in the sequence of values of d. 
; The first value is 1, the second a power of 2 and the third is again a 1 
; To find out the relative place of a value in a cycle take the index of the  
; value in the sequence modulus 3.       
; Further note the second value within a cycle goes up from 2 to 2+2 to 2+2+2 ... 
  
(define (d i) ;  
  (define (d-iter  value times-two j) 
    (let ((j-mod-3 (modulo j 3))) 
      (if (> j  i) 
          value 
          (d-iter 
           (cond ((= j-mod-3 1) 1) 
                 ((= j-mod-3 2) times-two) 
                 ((= j-mod-3 0) 1)) 
           (if (= j-mod-3  2) 
               (+ times-two 2) 
               times-two) 
           (+ j 1))))) 
  (d-iter 0 2 1))         
  
(define (euler-e)   ;multiplication by 1.0 forces fraction to real 
  (* 1.0 (+ (cont-frac (lambda (i) 1) d 100) 2))) 
  
(define (enum f n)  ;displays the function values upto and including n 
  (define (enum-iter list-of-values i) 
    (if (= i  n) 
        (display (reverse list-of-values)) 
        (enum-iter (cons (f i) list-of-values) (+ i 1)))) 
  (enum-iter '() 1)) 