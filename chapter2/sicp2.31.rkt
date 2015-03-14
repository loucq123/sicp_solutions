#lang racket
(define (tree-map proc items)
  (cond ((null? items) '())
        ((not (pair? items)) (proc items))
        (else
        (cons (tree-map proc (car items)) (tree-map proc (cdr items))))))
(define (square x) (* x x))
(define (square-tree tree) (tree-map square tree))
(define tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))