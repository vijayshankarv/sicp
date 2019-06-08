#lang sicp

(define (logical-and s1 s2)
  (cond ((= s1 0) 0)
        ((= s2 0) 0)
        ((and (= s1 1) (= s2 1)) 1)
        (else (error "Invalid signals" ))))

(define a '())
(logical-and 1 a)