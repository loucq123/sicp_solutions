#lang racket
(define (expt b n)
  (define (expt-helper b n product)
    (if (= n 0)
        product
        (if (odd? n)
            (expt-helper product (/ (- n 1) 2) (* b b product))
            (expt-helper product (/ n 2) (* b product)))))
    (expt-helper b (+ n 1) 1))
(define (odd? x)
  (= (remainder x 2) 1))
;have a better way