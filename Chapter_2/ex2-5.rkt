#lang sicp

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car z)
  (define (iter z)
    (if (> (remainder z 3) 0)
        (log z 2)
        (iter (/ z 3))
        ))
  (iter z))

(define (cdr z)
  (define (iter z)
    (if (> (remainder z 2) 0)
        (log z 3)
        (iter (/ z 2))
        ))
  (iter z))

; test

(define z (cons 2 3))
(car z)
(cdr z)