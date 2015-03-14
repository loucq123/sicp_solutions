#lang racket
(define (split first-action second-action)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((small (split first-action second-action) (painter (- n 1))))
          (first-action painter (second-action small small))))))