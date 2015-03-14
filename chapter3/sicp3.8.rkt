#lang racket
(define (f number)
  (if (= number 0)
      (begin (set! f (lambda (n) 0))
             0)
      (begin (set! f (lambda (n) 1/2))
             1/2)))
