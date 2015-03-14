#lang racket
(define (below1 painter1 painter2)
  (let ((split-point (make-vec (0 0.5))))
    (let ((down-painter 
           (transform-painter painter1 
                              (make-vect 0 0)
                              (make-vect 1 0)
                              (make-vect split-point)))
          (up-painter
           (transform-painter painter2
                              (make-vect split-point)
                              (make-vect 1 0.5)
                              (make-vect 0 1))))
      (lambda (frame)
        (down-painter frame)
        (up-painter frame)))))
(define (below2 painter1 painter2)
  (beside (right-rotate90 painter1) (right-rotate90 painter2)))
                              