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
       (make-interval (/ 1.0 (lower-bound y))
                      (/ 1.0 (upper-bound y)))) ))

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

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one (add-interval (div-interval one r1)
                       (div-interval one r2)))))

; Answer to Eva Lu Ator's point: yes par2 is a better procedure for calculting parallel resistances
; than par1. This is because par2 performs less operations on the intervals than par1. This is
; important since each time an interval has an operation performed on it, the tolerance is applied to
; calculate its bounds, accumulating error the more operations are performed. A better approach would
; be to use the nominal values throughout all calculations, and then only apply tolerances at the end.

; test

(define i1 (make-center-percent 50 10))
(define i2 (make-center-percent 25 10))

(par1 i1 i2)
(par2 i1 i2)

(define one (make-interval 1 10))

; this should give the original interval (i.e. inverse of an inverse) but it doesn't since one has a
; tolerance that is applied multiple times
(display "should be (45.0, 55.0): ") (div-interval one (div-interval one i1))