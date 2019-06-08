#lang racket

(define (last-pair x)
  (if (null? (cdr x)) (list (car x)) (last-pair (cdr x))))

(last-pair (list 1 2 3 4 5))

(last-pair (list 1 2))

(last-pair (list 2 1 8 9 10 11 12 121))