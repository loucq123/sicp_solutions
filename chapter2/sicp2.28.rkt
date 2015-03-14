#lang racket
(define (fringe x)
  (cond ((null? x) '())
        ((pair? (car x)) (append (fringe (car x)) (fringe (cdr x))))
        (else (cons (car x) (fringe (cdr x))))))
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))
;(define x (list (list 1 2) (list 3 4)))
;(fringe x)
;(fringe (list x x))