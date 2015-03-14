#lang racket
(define (equal? items1 items2)
  (cond ((and (null? items1) (null? items2)) true)
        ((and (pair? (car items1)) (pair? (car items2)))
             ((equal? (car items1) (car items2)
             (equal? (cdr items1) (cdr items2)))))
        ((and (not (pair? (car items1))) (not (pair? (car items2))) (eq? (car items1) (car items2)))
         (equal? (cdr items1) (cdr items2)))
        (else false)))
;test
(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))