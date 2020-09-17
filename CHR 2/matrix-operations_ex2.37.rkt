#lang racket
;; Accumulates the result of the first and the already-accumulated 
;; rest. 
(define (accumulate op initial sequence) 
  (if (null? sequence) 
      initial 
      (op (car sequence) 
          (accumulate op initial (cdr sequence))))) 
  
  
;; accumulate-n which works on trees
(define (accumulate-n op init sequence) 
  (define nil '()) 
  (if (null? (car sequence)) 
      nil 
      (cons (accumulate op init (map car sequence)) 
            (accumulate-n op init (map cdr sequence))))) 
  
  
(define matrix (list (list 1 2 3 4) (list 5 6 7 8) (list 9 10 11 12))) 

;; Matrix operations

;; i-index element of every sequence multipled and summed to give dot product
(define (dot-product v1 v2) 
  (accumulate + 0 (map * v1 v2)))  
  
;; Test 
(dot-product (list 1 2 3) (list 4 5 6)) 
  
  
;; matrix-vector multiplication - Every sequence (vector) of the matrix
;; undergoes dot product multiplication with given vector to produce a new vector
(define (matrix-*-vector m v) 
  (map (lambda (m-row) (dot-product m-row v)) 
       m)) 
  
;; Test 
(matrix-*-vector matrix (list 2 3 4 5)) 
  
  
;; Transpose and MxN matrix to NxM - cons the i-index elements of every sequence
;; to create N new rows and M new columns from N columns and M rows.
(define nil '()) 
(define (transpose m) 
  (accumulate-n cons nil m)) 
  
;; Test 
(transpose matrix) 
  
  
;; matrix-matrix multiplication
(define (matrix-*-matrix m n) 
  (let ((n-cols (transpose n))) 
    (map (lambda (m-row) 
           (map (lambda (n-col)  
                  (dot-product m-row n-col))  
                n-cols)) 
         m))) 
  
;; But the inner map is just matrix-*-vector, so here's better: 
(define (matrix-*-matrix-2 m n) 
  (let ((n-cols (transpose n))) 
    (map (lambda (m-row) (matrix-*-vector n-cols m-row)) 
         m))) 
  
;; Test 
(matrix-*-matrix matrix (list (list 1 2) (list 1 2) (list 1 2) (list 1 2))) 