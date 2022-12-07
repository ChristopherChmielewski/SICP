#lang sicp

; cons returns an anonymous procedure that take m as arguments and applies them to x and y
(define (cons x y)
  (lambda (m) (m x y)))

; car takes a procedure (i.e. our procedurally define pair) z as an argument and provides z with
; an anonymous procedure as an argument. This anonymous procedure is applied against p and q
; (which map to x and y) and returns p (x)
(define (car z)
  (z (lambda (p q) p)))

; cdr implementation that returns the second element of the pair z
(define (cdr z)
  (z (lambda (p q) q)))

; test
(define z (cons 1 2))

(car z)
(cdr z)

; substition model evaluation
; (define z (cons 1 2))
; (car z)
; (car (lambda (m) (m 1 2)))
; ((lambda (m) (m 1 2)) (lambda (p q) p))
; ((lambda (p q) p) x y)
; (lambda (1 2) 1)