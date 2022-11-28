#lang sicp

(define dx 0.00001)

(define (compose f g)
  (lambda (x) (f (g x)))
  )

(define (repeated f n)
  (define (iter n)
    (if (= n 1)
        f
        (compose f (iter (- n 1))
                 )))
  (iter n)
  )

(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)
    )
  )

(define (n-fold-smooth f n)
  ((repeated smooth n) f)
  )

; test
((n-fold-smooth inc 5) 0)
