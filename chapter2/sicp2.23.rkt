#lang racket
(define (for-each proc items)
  (cond ((null? items) 'done)
        (else (proc (car items))
              (for-each proc (cdr items)))))