#lang sicp

(define (append x y)
  (if (null? x)
      y
      (cons (car x) (append (cdr x) y))))




(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)


(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))

z

(cdr x)

(define w (append! x y))

w

(cdr x)



(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))


(count-pairs '((1 2) 3 4))

(count-pairs '((1) 3 4))

(count-pairs '((1) (3 '())))

(define a '(1))
(define b (cons a a))
(define c (list b))
(count-pairs c)