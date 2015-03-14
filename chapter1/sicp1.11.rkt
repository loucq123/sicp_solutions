#lang racket
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))
(define (f-iter n)
  (define (f-helper a b c count)
    (if (= count n)
        a
        (f-helper b c (+ c (* 2 b) (* 3 a)) (+ count 1))))
  (if (< n 3)
      n
      (f-helper 0 1 2 0)))