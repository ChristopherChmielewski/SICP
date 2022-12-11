#lang sicp

(define (last-pair items)
  (define (iter i n)
    (if (null? (cdr i))
        (list (car i))
        (iter (cdr i) (+ n 1))
        ))
  (iter items 0))

; test

(last-pair (list 1 2 3 4))