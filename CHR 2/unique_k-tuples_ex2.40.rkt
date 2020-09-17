#lang racket


(define nil '())

(define (accumulate op initial sequence) 
  (if (null? sequence) 
      initial 
      (op (car sequence) 
          (accumulate op initial (cdr sequence))))) 
  
(define (enumerate-interval low high) 
  (if (> low high) 
      nil 
      (cons low (enumerate-interval (+ low 1) high)))) 
  
(define (flatmap proc seq) 
  (accumulate append nil (map proc seq)))
(define (flatmap-2 proc seq) 
  (map proc seq))

(define (unique-pairs n) 
  (flatmap (lambda (i)  
             (map (lambda (j) (list i j)) 
                  (enumerate-interval 1 (- i 1)))) 
           (enumerate-interval 1 n)))

;; unique triples from [1...n]
(define (unique-triples n)
  (flatmap (lambda (i)
             (map (lambda (j) (cons i j))
                  (unique-pairs (- i 1))))
           (enumerate-interval 3 n)))

;; generalized to k-tuples
(define (unique-tuples n k) 
  (define (iter m k) 
    (if (= k 0) 
        (list nil) 
        (flatmap (lambda (j) 
               (map (lambda (tuple) (cons j tuple)) 
                    (iter (+ j 1) (- k 1)))) 
             (enumerate-interval m n)))) 
  (iter 1 k))