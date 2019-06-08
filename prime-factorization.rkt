#lang racket

(define (cons x y)
  (* (expt 2 x) (expt 3 y)))

(cons 2 3)

(define (car x)
  (define (iter n count)
    (if (> (remainder n 2) 0)
        count
        (iter (/ n 2) (+ count 1))))
  (iter x 0))

(car (cons 2 3))


(define (car2 x)
  (if (= (remainder x 3) 0)
    (car2 (/ x 3))
    (log x 2)))

(define (cdr2 x)
  (if (= (remainder x 2) 0)
    (cdr2 (/ x 2))
    (log x 3)))

(car2 (cons 20 40))

(cdr2 (cons 30 21))
       