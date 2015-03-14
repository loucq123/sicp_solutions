#lang racket
(define (reverse1 sequence)
  (fold-right (lambda (x y) (append y (list x)))
              '()
              sequence))
(define (reverse2 sequence)
  (fold-left (lambda (x y) (cons y x))
             '()
             sequence))