#lang racket
(define (fringe tree)
  
  (define (build-fringe items acc)
    (cond ((null? items) acc)
          ((not (pair? items)) (cons items acc))
          (else (build-fringe (car items)
                              (build-fringe (cdr items) acc)))))

  (build-fringe tree '()))