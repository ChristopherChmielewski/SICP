#lang sicp

(define (compose f g)
  (lambda (x) (f (g x)))
  )

(define (square x) (* x x))

(define (repeated f n)
  (define (iter n)
    (if (= n 1)
        f
        (compose f (iter (- n 1))
                 )))
  (iter n)
  )

((repeated square 2) 5)