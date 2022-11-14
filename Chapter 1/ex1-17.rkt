#lang racket/base
(require racket/trace)

(define (even? n)
  (= (remainder n 2) 0)
  )

(define (halve n) (/ n 2))

(define (double n) (* n 2))

(define (mt a b)
  (cond ((or (= a 0) (= b 0)) 0)
        ((even? a) (mt (halve a) (double b)))
        (else (+ b (mt b (- a 1)))))
  )

; the linear recursive definition of mt from the book
(define (mt-linear a b)
  (if (= b 0)
      0
      (+ a (mt-linear a (- b 1)))))

; test
(define a 123456789123456789123456789123456789123456789123456789123456789123456789123456789)
(define b 987654321987654321987654321987654321987654321987654321987654321987654321987654321)

(define (test a b)
  (if (= (mt a b) (* a b))
      (display "PASSED")
      (display "FAILED")
      )
  (newline))

(test a b)

;trace

(trace mt)
(mt 17 19)

(trace mt-linear)
(mt-linear 17 19)