#lang racket
(define (factorial n)
  (if (= n 0)
      1
      (* n (factorial (- n 1)))))
(define (factorial-iter n)
  (define (fact n count ans)
    (if (< n count)
        ans
        (fact n (+ count 1) (* ans count))))
  (fact n 1 1))
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1)) (fib (- n 2))))))
;这不是迭代。。