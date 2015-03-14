#lang racket
;a
((segment->painter (list (cons (cons 0 0) (cons 0 1))
                         (cons (cons 0 1) (cons 1 1))
                         (cons (cons 1 1) (cons 1 0))
                         (cons (cons 1 0) (cons 0 0)))) frame)
;b
((segment->painter (list (cons (cons 0 0) (cons 1 1))
                         (cons (cons 1 0) (cons 0 1)))) frame)
;c
((segment->painter (list (cons (cons (- 1 2) 0) (cons 1 (- 1 2)))
                         (cons (cons 1 (- 1 2)) (cons (- 1 2) 1))
                         (cons (cons (- 1 2) 1) (cons 0 (- 1 2)))
                         (cons (cons 0 (- 1 2)) (cons (- 1 2) 0)))) frame)
;is not good
;use abstract?
