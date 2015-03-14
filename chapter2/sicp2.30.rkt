#lang racket
;first is to save leaves to be a list
(define (square-tree1 tree)
  (cond ((null? tree) '())
        ((not (pair? (car tree)) ) (cons (square (car tree))  (square-tree1 (cdr tree))))
        (else (append (square-tree1 (car tree))  (square-tree1 (cdr tree))))))
(define (square-tree2 tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree2 (car tree)) (square-tree2 (cdr tree))))));split and combine
(define (square-tree3 tree)
  (map (lambda (sub-tree)
         (if (not (pair? sub-tree))
             (square sub-tree)
             (square-tree3 sub-tree)))
       tree))
(define (square x) (* x x))
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))
;test
(define tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))