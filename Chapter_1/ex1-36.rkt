#lang sicp

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (display guess) (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(display "Without average damping: ") (newline)
(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.71)
(display "With average damping: ") (newline)
(fixed-point (lambda (x) (* 0.5 (+ (/ (log 1000) (log x)) x))) 2.71)

