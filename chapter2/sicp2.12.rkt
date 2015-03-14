#lang racket
(define (make-center-percent center percent)
  (make-interval (- center (* center percent))
                 (+ center (* center percent))))
(define (center center-percent)
  (/ (+ (lower-bound center-percent) (upper-bound center-percent)) 2))
(define (percent center-percent)
  (/ (- (upper-bound center-percent) (center center-percent)) (center center-percent)))