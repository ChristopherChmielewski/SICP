#lang sicp

(define (make-segment p1 p2)
  (cons p1 p2) )

(define (start-point s)
  (car s) )

(define (end-point s)
  (cdr s) )

(define (make-point x y)
  (cons x y) )

(define (x-coordinate p)
  (car p) )

(define (y-coordinate p)
  (cdr p) )

(define (midpoint s)
  (cons
   (/ (+ (x-coordinate (start-point s)) (x-coordinate (end-point s))) 2)
   (/ (+ (y-coordinate (start-point s)) (y-coordinate (end-point s))) 2) ))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-coordinate p))
  (display ",")
  (display (y-coordinate p))
  (display ")") )

; test

(define p1 (make-point 1 2))
(define p2 (make-point 3 4))

(define segment (make-segment p1 p2))

(print-point (midpoint segment))
