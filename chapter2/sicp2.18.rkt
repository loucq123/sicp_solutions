#lang racket
(define (reverse items)
  (if (null? items)
      '()
      (append (reverse (cdr items))
               (list (car items)))));here must use list
(define (append list1 list2)        ;because the first arguement of append is must list
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))