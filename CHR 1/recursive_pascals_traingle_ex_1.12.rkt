;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname recursive_pascals_traingle_ex_1.12) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (pascal r c) 
  (cond ((or (< r c)  
             (< c 1)) 0 ) 
        ((or (= c 1) 
             (= c r)) 1)  
        (else (+ (pascal (- r 1) (- c 1)) (pascal (- r 1) c))))) 