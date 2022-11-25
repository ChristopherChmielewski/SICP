#lang sicp

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))
      )
  )

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))
        ))
  (iter a null-value)
  )

; test

(define (cube x) (* x x x))
(define (identity n) n)
(define (inc n) (+ n 1))

(accumulate + 0 cube 1 inc 10)  ; sum of cubes from 1 to 10
(accumulate-iter * 1 identity 1 inc 5)  ; 5 factorial