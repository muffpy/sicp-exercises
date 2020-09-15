#lang racket
(define nil '())

;; Deep reverse.  Same as reverse, but when adding the car to the 
;; result, need to check if the car is a list.  If so, deep reverse 
;; it. 
  
;; First try: (similar structure to rverse)
(define (deep-reverse items) 
  (define (deep-rev-imp items result) 
    (if (null? items) 
        result 
        (let ((first (car items))) ;; check if car of pair is a pair or an item
          (deep-rev-imp (cdr items) 
                        (cons (if (not (pair? first)) 
                                  first 
                                  (deep-reverse first)) ;; deep-reverse on pair
                              result))))) 
  (deep-rev-imp items nil)) 
 
  
;; Works, but it's a bit hard to read?  Refactoring: 
  
(define (deep-reverse-2 items)
  ;; method to check and handle a pair
  (define (deep-rev-if-required item) 
    (if (not (pair? item)) 
        item 
        (deep-reverse-2 item)))
  ;; deep-rev main
  (define (deep-rev-imp items result) 
    (if (null? items) 
        result 
        (deep-rev-imp (cdr items) 
                      (cons (deep-rev-if-required (car items)) 
                            result)))) 
  (deep-rev-imp items nil)) 