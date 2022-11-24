#lang sicp

(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))

(define (inc k) (+ k 2))  ; increment k by 2 to iterate through just evens or just odds

(define (simpson-integral f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (* (/ h 3) (+ (y 0) (* 4 (sum y 1.0 inc (- n 1))) (* 2 (sum y 2.0 inc (- n 1))) (y n))))  ; y0 + 4(y-odd) + 2(y-even) + yn

(simpson-integral cube 0 1 10)
(simpson-integral cube 0 1 100)
(simpson-integral cube 0 1 1000)
(simpson-integral cube 0 1 10000)
(simpson-integral cube 0 1 100000)
(simpson-integral cube 0 1 1000000)
(simpson-integral cube 0 1 10000000)

; oddly enough the solution seems to grow slightly less accurate with increasing n. The solution at
; https://sicp-solutions.net/post/sicp-solution-exercise-1-29/ is the same way


