#lang racket
(define (make-accumulator initial)
  (lambda (add-number)
    (begin (set! initial (+ initial add-number))
           initial)))
;;test
(define  A (make-accumulator 5))