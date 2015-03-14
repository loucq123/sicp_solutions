#lang planet neil/sicp
(define (lookup key1 key2 table)
  (let ((subtable (assoc key1 (cdr table))))
    (if subtable
        (let ((records (assoc key2 (cdr subtable))))
          (if records
              (cdr records)
              false))
        false)))
(define (assoc key records)
  (cond ((null? records) false)
        ((equal? key (caar records)) (car records))
        (else (assoc key (cdr records)))))
(define (insert! key1 key2 value table)
  (let ((subtable (assoc key1 (cdr table))))
    (if subtable
        (let ((records (assoc key2 (cdr subtable))))
          (if records
              (set-cdr! records value)
              (set-cdr! subtable (cons (key2 value) (cdr subtable)))))
        (set-cdr! table (cons (list key1 (cons key2 value)) (cdr table)))))
  'ok)
;(define (make-2dtable)
;  (list '*table1* (list '*table2)))
(define (make-2dtable same-key?)
  (define (assoc key records)
    (cond ((null? records) false)
          ((same-key? key (caar records)) (car records))
          (else (assoc key (cdr records)))))
  (let ((local-table (list '*table)))
    (define (lookup key-1 key-2)
      (let ((subtable (assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable))))
              (if record
                  (cdr record)
                  false))
            false)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable))))
              (if record 
                  (set-cdr! record value)
                  (set-cdr! subtable
                            (cons (cons key-2 value)
                                  (cdr subtable)))))
            (set-cdr! local-table
                      (cons (list key-1
                                  (cons key-2 value))
                            (cdr local-table)))))
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))
(define operation-table (make-2dtable eq?))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))
      
    
        