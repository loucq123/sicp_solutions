#lang planet neil/sicp
(define (deque)
  (cons (cons '() '()) (cons '() '())))
(define (front-deque deque)
  (car deque))
(define (rear-deque deque)
  (cdr deque))
(define (empty? deque)
  (null? (car (front-deque deque))))
(define (set-front! queue item)
  (set-car! (car queue) item))
(define (set-rear! queue item)
  (set-cdr! (car queue) item))
(define (front-insert-deque! deque item)
  (let ((new-pair (cons item '())))
    (if (empty deque)
        (begin
          (set-front! (front-deque deque) new-pair)
          (set-rear! (front-deque deque) new-pair)
          (set-front! (rear-deque deque) new-pair)
          (set-rear! (rear-deque deque) new-pair)
          deque)
        (
        
      