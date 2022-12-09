#lang sicp

(define (make-interval a b) (cons a b))

(define (lower-bound interval)
  (let ((b1 (car interval))
        (b2 (cdr interval)))
    (if (< b1 b2)
        b1
        b2) ))

(define (upper-bound interval)
  (let ((b1 (car interval))
        (b2 (cdr interval)))
    (if (> b1 b2)
        b1
        b2) ))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if (<= (lower-bound y) 0)
      (error "div-interval: cannot divide by an interval that spans 0")
      (mul-interval
       x
       (make-interval (/ 1.0 (upper-bound y))
                      (/ 1.0 (lower-bound y)))) ))

(define (width interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2.0))

(define (center interval)
  (/ (+ (lower-bound interval) (upper-bound interval)) 2))

(define (make-center-percent c p)
  (cons (- c (* c (/ p 100.0))) (+ c (* c (/ p 100.0)))))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (percent interval)
  (round (* (- (/ (upper-bound interval) (center interval)) 1.0) 100)))

; test

(define i1 (make-center-percent 1.5 25))
(define i2 (make-center-percent 1.5 25))

(define i3 (mul-interval i1 i2))
(percent i3)

; the sum of the two resistor tolerances p1 and p2 can be used as an approximation of the real
; combined tolerance when multiplying the intervals of two resistors provided that the tolerances
; of the resistors are sufficiently small. Using the sum p1 + p2 will have an error of p1*p2

(define (approx-tolerance p1 p2)
  (+ p1 p2))
