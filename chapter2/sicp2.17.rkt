#lang racket
(define (last-pair list)
  (if (eq? list '())
      '()
      (if (null? (cdr list))
          (car list)
          (last-pair (cdr list)))))