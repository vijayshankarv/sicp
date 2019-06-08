#lang racket

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))


(define (cdr z)
  (z (lambda (p q) q)))


(cdr (cons 1 2))

(cdr (cdr (cdr (cons 3 (cons 4 (cons 5 null))))))



