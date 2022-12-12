#lang sicp

(define (for-each proc items)
  (define (helper proc items eval)
    (if (null? items)
        true
        (helper proc (cdr items) (proc (car items))) ))
  (helper proc items nil))

(for-each (lambda (x) (display x) (newline)) (list 1 2 3))