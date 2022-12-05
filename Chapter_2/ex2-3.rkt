#lang sicp

(define (make-segment p1 p2)
  (if (or (< (x-coordinate p1) (x-coordinate p2)) (< (y-coordinate p1) (y-coordinate p2)) )
      (cons p1 p2)  ; arrange points so that lowest, leftmost point first
      (cons p2 p1) ))

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

(define (points-equal p1 p2)
  (let ((x1 (x-coordinate p1))
        (x2 (x-coordinate p2))
        (y1 (y-coordinate p1))
        (y2 (y-coordinate p2)))
    (if (and (= x1 x2) (= y1 y2))
        true
        false)))

(define (first-segment r)
  (car r) )

(define (second-segment r)
  (cdr r) )

(define (distance p1 p2)
  (let ((x1 (x-coordinate p1))
        (y1 (y-coordinate p1))
        (x2 (x-coordinate p2))
        (y2 (y-coordinate p2)))
    (sqrt (+ (expt (- x2 x1) 2) (expt (- y2 y1) 2)))
    ))

(define (midpoint s)
  (cons
   (/ (+ (x-coordinate (start-point s)) (x-coordinate (end-point s))) 2)
   (/ (+ (y-coordinate (start-point s)) (y-coordinate (end-point s))) 2) ))

; define a rectangle as two line segments (extrapolating the 2 line segments to connect all the edges
; while maintaining perpendicular corners will create a rectangle)
(define (make-rect s1 s2)
  (cons s1 s2))

(define (make-rect-from-points p1 p2 p3 p4)
  (let ((s1 (make-segment p1 p2))
        (s2 (make-segment p3 p4)))
    (cons s1 s2) ))

(define (rect-perimeter r)
  ; precondition: the lowest, leftmost point is the first point in each segment of the rectangle
  (let ((p1 (start-point (first-segment r)))
        (p2 (end-point (first-segment r)))
        (p3 (start-point (second-segment r)))
        (p4 (end-point (second-segment r))))
    (if (or (points-equal p1 p2) (points-equal p1 p3) (points-equal p1 p4)
            (points-equal p2 p3) (points-equal p2 p4) (points-equal p3 p4))
        (* (+ (distance p1 p2) (distance p3 p4)) 2) ; if segments share a point they are perpendicular
        (* (+ (distance p1 p2) (distance p1 p3)) 2) ; if segments do not share a point they are parallel (precondition applies here)
        )) )

(define (rect-area r)
  ; precondition: the lowest, leftmost point is the first point in each segment of the rectangle
  (let ((p1 (start-point (first-segment r)))
        (p2 (end-point (first-segment r)))
        (p3 (start-point (second-segment r)))
        (p4 (end-point (second-segment r))))
    (if (or (points-equal p1 p2) (points-equal p1 p3) (points-equal p1 p4)
            (points-equal p2 p3) (points-equal p2 p4) (points-equal p3 p4))
        (* (distance p1 p2) (distance p3 p4)) ; if segments share a point they are perpendicular
        (* (distance p1 p2) (distance p1 p3)) ; if segments do not share a point they are parallel (precondition applies here)
        )) )

(define (print-point p)
  (newline)
  (display "(")
  (display (x-coordinate p))
  (display ",")
  (display (y-coordinate p))
  (display ")") )

(define p1 (make-point 0 0))
(define p2 (make-point 0 2))

(define p3 (make-point 4 0))
(define p4 (make-point 4 2))

(define s1 (make-segment p1 p2))
(define s2 (make-segment p3 p4))

(define s3 (make-segment p2 p1))
(define s4 (make-segment p3 p4))

(define r (make-rect s1 s2))
(define r2 (make-rect s3 s4))

(define r3 (make-rect-from-points p1 p2 p3 p4))
(define r4 (make-rect-from-points p2 p1 p4 p3))

(rect-perimeter r)
(rect-perimeter r2)

(rect-perimeter r3)
(rect-perimeter r4)

(rect-area r)
(rect-area r2)

(rect-area r3)
(rect-area r4)