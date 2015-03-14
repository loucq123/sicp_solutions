#lang planet neil/sicp
(define (count-pairs x)
  (let ((check '()))
    (define (helper x)
      (if (or (not (pair? x)) (memq x check))
          0
          (begin 
            (set! check (cons x check))
            (+ (helper (car x)) 
               (helper (cdr x))
               1))))
  (helper x)))
         