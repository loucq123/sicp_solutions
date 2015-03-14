#lang racket
(define (make-point x y)
  (cons x y))
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))
(define (make-segment sp ep)
  (cons sp ep))
(define (start-point seg)
  (car seg))
(define (end-point seg)
  (cdr seg))
(define (midpoint-segment seg)
  (define (average x y)
    (/ (+ x y) 2))
  (make-point (average (x-point (start-point seg)) (x-point (end-point seg)))
              (average (y-point (start-point seg)) (y-point (end-point seg)))))
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))
;test
(define x (make-point 2 2))
(define y (make-point 4 4))
(print-point x)
(define p (make-segment x y))
(print-point (midpoint-segment p))