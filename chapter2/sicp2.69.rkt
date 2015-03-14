#lang racket
(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))
(define (successive-merge leaves)
  (cond ((null? leaves) '())
        ((null? (cdr leaves)) (car leaves))
        (else
         (successive-merge (adjoin-set (make-code-tree (car leaves) (cadr leaves))
                                       (cddr leaves))))))
(define pairs '((A 4) (B 2) (C 1) (D 1)))
(decode sample-message (generate-huffman-tree pairs))