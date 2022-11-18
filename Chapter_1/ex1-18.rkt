#lang racket/base
(require racket/trace)

(define (even? n)
  (= (remainder n 2) 0)
  )

(define (halve n) (/ n 2))

(define (double n) (* n 2))

(define (mt a b)
  (define (mt-iter a b c)
    (cond ((or (= a 0) (= b 0)) c)
          ((even? a) (mt-iter (halve a) (double b) c))
          (else (mt-iter (- a 1) b (+ c b)))
          ))
  (mt-iter a b 0)
  )

; (mt 7 3)

; test
(define a 17)
(define b 19)

(define (test a b)
  (if (= (mt a b) (* a b))
      (display "PASSED")
      (display "FAILED")
      )
  (newline))

(test a b)
(test 17 0)
(test 0 17)
(test 0 0)

;trace

(trace mt)
(mt a b)