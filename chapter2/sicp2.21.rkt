#lang racket
(define (square-list1 items)
  (if (null? items)
      '()
      (cons (* (car items) (car items)) (square-list1 (cdr items)))))
(define (square-list2 items)
  (map square items))
(define (square x)
  (* x x))
