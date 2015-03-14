#lang racket
(define (fast-product a b)
  (define (product-iter a b product)
    (cond ((= b 0) 0)
          ((= b 1) (+ a product))
          (else (if (even? b)
                    (product-iter (double a) (halve b)  product)
                    (product-iter a (- b 1) (+ a product))))))
  (product-iter a b 0))
(define (double x) (+ x x))
(define (halve x) (/ x 2))
(define (even? x)
  (= (remainder x 2) 0))
                    