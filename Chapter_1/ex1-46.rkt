#lang sicp

; 1. Write a procedure iterative-improve that takes two procedures as arguments: good-enough? and
;    improve
; 2. iterative-improve should return a procedure that takes a guess as an argument and keeps improving
;    the guess until it is good enough

(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))
        ))
  (lambda (guess) (iter guess)))

; square root subprocedures

(define (square x) (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) 1.0)
  )

; square root test

(sqrt 4)
(sqrt 9)
(sqrt 16)
(sqrt 25)

; fixed point subprocedures and original fixed-point1 procedure

(define tolerance 0.0001)

(define (fixed-point1 f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; new fixed-point procedure using iterative-improve

(define (fixed-point f first-guess)
  (define (close-enough? v1)
    (let ((v2 (next v1)))
      (< (abs (- v1 v2))
         tolerance)))
  (define (next guess)
    (f guess))
  ((iterative-improve close-enough? next) first-guess))

; fixed point test

(fixed-point1 (lambda (x) (+ 1 (/ 1 x))) 2.0)  ; golden ratio
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 2.0)  ; golden ratio