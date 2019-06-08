#lang racket

(define (square x) (* x x))
(define (sum-of-squares a b) (+ (square a) (square b)))

(define (biggest-sum-squares a b c)
  (cond ((and (> a b) (> b c)) (sum-of-squares a b))
        ((and (> a b) (> c b)) (sum-of-squares a c))
        ((and (> b a) (> c a)) (sum-of-squares b c))))


(biggest-sum-squares 1 2 3)
