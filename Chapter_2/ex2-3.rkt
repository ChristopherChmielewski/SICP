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

; define a rectangle as two line segments (extrapolating the 2 line segments to connect all the edges
; while maintaining perpendicular corners will create a rectangle)
(define (make-rect s1 s2)
  (cons s1 s2))

(define (rect-perimeter r)
  ())

(define (rect-area r)
  ())

(define (print-point p)
  (newline)
  (display "(")
  (display (x-coordinate p))
  (display ",")
  (display (y-coordinate p))
  (display ")") )
