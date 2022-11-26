#lang sicp

(define (f g)
  (g 2))

(define (square x) (* x x))

(f square)
(f (lambda (z) (* z (+ z 1))))

; Answer

; if we attempt to evaluate (f f) using the definition of f above, then the interpreter will eventually
; try to evaluate (2 2) which will result in a
; "application: not a procedure; expected a procedure that can be applied to arguments" error since
; 2 is not a procedure that can be applied to another number (in this case the other number is 2)

; test
(f f)
