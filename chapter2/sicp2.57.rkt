#lang racket
(define (derive exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (derive (addend exp) var)
                   (derive (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (derive (multiplicand exp) var))
          (make-product (derive (multiplier exp) var)
                        (multiplicand exp))))
        (else
         (error "unknow expression type -- Derive" exp))))
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (sum? exp) (and (pair? exp) (eq? (car exp) '+))) ;pay attention to pair?
(define (addend s) (cadr s))
(define (augend s)
  (if (null? (cdddr s))
      (caddr s)
      (cons '+ (cons (caddr s) (cdddr s)))))
;(define (make-sum a1 a2) (list '+ a1 a2))       this is not a good way, 
;(define (make-product a1 a2) (list '* a1 a2))   because it's not simplified
(define (product? exp) (and (pair? exp) (eq? (car exp) '*)))
(define (multiplier p) (cadr p))
(define (multiplicand p)
  (if (null? (cdddr p))
      (caddr p)
      (cons '* (cons (caddr p) (cdddr p)))))
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))
(define (=number? exp num)
  (and (number? exp) (= exp num)))
(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2) (* m1 m2)))
        (else (list '* m1 m2))))
;test
(derive '(+ x 3) 'x)
(derive '(* x y) 'x)
(derive '(* (* x y) (+ x 3)) 'x)
(derive '(* x y (+ x 3)) 'x)
(define exp '(* x y (+ x 3)))