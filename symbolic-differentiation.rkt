#lang racket


(car ''abracadabra)

(cdr ''a)

(quote (quote a))

(cdr ''abc)

(cdr (cdr ''abc))


'(quote a)


(define (variable? x) (symbol? x))


(variable? 2)


(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))


(define (make-sum a1 a2) (list '+ a1 a2))

(define (make-product m1 m2) (list '* m1 m2))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (augend s) (cons '+ cddr s))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p) (cddr p))

(define (make-exp a1 a2) (list '** a1 a2))

(define (exp? x)
  (and (pair? x) (eq? (car x) '**)))

(define (base p) (cadr p))

(define (exponent p) (cddr p))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        ((exp? exp)
         (make-product
          (make-product (exponent exp) (make-exp (base exp) (make-sum (exponent exp) -1)))
          (deriv (base exp) var)))
        (else
         (error "unknown expression type -- DERIV" exp))))


(augend '(+ x 3 4))

(deriv '(+ x 3 4) 'x)

(deriv '(** x b) 'x)

(cddr (list 1 2 3 4 0 9 18 19 20 21 23 30 239 1231 0 12 1 113 1212 434))
