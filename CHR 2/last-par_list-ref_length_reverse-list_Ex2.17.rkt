#lang racket

(define (last-pair items) 
   (define (iter items result) 
     (if (null? items) 
         result 
         (iter (cdr items) items))) 
   (iter items items)) 

;; test cases
(last-pair (list 23 72 149 34)) ;;= (34) 
(last-pair '()) ;;= ()

;; alt:
(define nil '()) 
  
 ;; procedure for length of list 
  
 (define length (lambda (list) 
               (if (null? list) 0 
                   (+ 1 (length (cdr list)))))) 
  
 ;; list-ref 
 (define list-ref (lambda (list n) 
               (if (= n 0) (car list) 
                   (list-ref (cdr list) (- n 1))))) 
  
 ;; last-pair procedure 
 (define last-pair-2 (lambda (list) 
                     (if (null? list) nil 
                         (let ((s (- (length list) 1))) 
                           (cons (list-ref list s) nil)))))

;; reverse a lsit
(define (reverse items)
  (define (iter items result)
    (if (null? items)
        result
        (iter (cdr items) (cons (car items) result))))
    (iter items nil))