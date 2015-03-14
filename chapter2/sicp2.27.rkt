#lang racket
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))
(define (deep-reverse x)
  (cond ((null? x) '())
        ((pair? (car x)) (append (deep-reverse (cdr x)) (list (deep-reverse (car x)))))
        (else
         (append (deep-reverse (cdr x))
              (list (car x))))))