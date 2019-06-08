#lang racket



(define (subsets s)
  (if (null? s)
      (list null)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(subsets (list 1 2 3 4))

(define (horner-eval x coefficient-sequence)
  (foldr (lambda (this-coeff higher-terms)
                (+ (* x higher-terms) this-coeff))
              0
              coefficient-sequence))


(define (flatmap proc seq)
  (foldr append null (map proc seq)))


(define (unique-pairs n)
  (define (pairs-with-i i)
    (map (lambda (j) (list i j)) (range (+ i 1) (+ 1 n))))
    (flatmap pairs-with-i (range  1 (+ 1 n))))


(unique-pairs 5)

(horner-eval 2 (list 5 1 2))