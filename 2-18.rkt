#lang racket


(define (last-pair x)
  (if (null? (cdr x)) (list (car x)) (last-pair (cdr x))))

(define (reverse x)
   (append
    (if (null? (cdr x))
        (list (car x))
         (reverse (cdr x)))
    (if (null? (cdr x))
        null (list (car x)))))


(reverse (list 1 4 9))
#(list (cdr (list 1 2 3)) (car (list 1 2 3)))

#(car (list 1 2 3))



(filter odd? (list 1 2 3 4 5))


(define (same-parity . x)
  (filter
   (if (odd? (car x)) 
      odd?
      even?)
   (cdr x)))



(same-parity 1 2 3 4 5)

#(define (reverse-new x)
  (define (iter x results)
    (cond (null? x)
        result
         (else (iter (cdr items)
                 (cons  (car item) results))
         ))))


(define (reverse-n1 x)
  (if (null? x)
      null
      (append (reverse (cdr x))
              (list (car x)))))

(reverse-n1 (list 1 2 9 16))


(define x (list (list 1 2) (list 3 4)))
(reverse x)

#(cdr x)

(define (deep-reverse x)
  (if (null? (cdr x))
      (car x)
      (append (deep-reverse (list (cdr x))) (deep-reverse (list (car x))) )))

#(deep-reverse x)


(define (fringe x)
   (if (pair? (car x))
       (append (fringe (car x)) (if (null? (cdr x))
                                  null
                                  (fringe (cdr x))))
       (append (list (car x)) (if (null? (cdr x))
                                  null
                                  (fringe (cdr x))))))


(define (fringe-n x)
   (cond ((null? x) null)
         ((pair? (car x))
          (append (fringe-n (car x)) (fringe-n (cdr x))))
     (else
        (append (list (car x)) (fringe-n (cdr x))))))


x
(fringe x)


(define yx (list (list 0 1 (list 1 2) (list 3 4))))
(fringe yx)

(fringe-n yx)
(fringe-n x)