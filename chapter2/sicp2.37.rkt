#lang racket
(define (map proc items)
  (if (null? items)
      '()
      (cons (proc  (car items)) (map proc (cdr items)))))
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))
(define (dot-product v w)
  (accumulate + 0 (map * v m)))
(define (matrix-*-vector m v)
  (map 