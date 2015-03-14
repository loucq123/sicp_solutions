#lang planet neil/sicp
(define (has-cycle? x)
  (let ((prev '()))
    (define (helper x)
      (cond ((or (not (pair? x)) (null? x)) false)
            ((memq x prev) true)
            (else
             (begin 
               (set! prev (cons x prev))
               (helper (cdr x))))))
    (helper x)))
;;;test
(define (memq obj arrey)
  (cond ((null? arrey) false)
        ((eq? obj (car arrey)) true)
        (else
         (memq obj (cdr arrey)))))
(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))
(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)
(define z (make-cycle (list 'a 'b 'c)))
(has-cycle? z)
                   