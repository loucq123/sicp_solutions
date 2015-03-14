#lang racket
(define (div-interval x y)
  (if (and (> (upper-bound y) 0) ( < (lower-bound y) 0))
      (error "Divisor interval is illegal")
      (mul-interval x
                    (make-interval (/ 1 (upper-bound y))
                                   (/ 1 (lower-bound y))))))