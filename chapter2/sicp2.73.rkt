#lang racket
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp val) 1 0))
        (else ((get 'deriv (operator exp)) (operands exp) var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))
(define (install-sum-package)
  (define (addend s) (cadr s))
  (define (augend s) (caddr s))
  (define (make-sum a1 a2) (list '+ a1 a2))
  ;to be continued