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

; Error explaination: the error here is the way div-interval, the selectors lower-bound and
; upper-bound, and mul-interval are defined.
;
; div-interval works by taking the inverse of the interval that is to be the denominator and
; then multipling it against the numerator.
;
; However, the selectors lower-bound and upper-bound will return the smaller of the two bounds and
; the larger of the two bounds respectively.
;
; mul-interval also finds the smallest product and the largest product of bounds for the new lower and
; upper bounds.
;
; This is a problem because when div-interval creates a new interval by taking the inverse of the
; denominator, for example (45, 55), it becomes (1/45, 1/55).
;
; However the selectors and mul-interval will flip the lower and upper bounds around to be
; (1/55, 1/45) since 1/55 < 1/45.
;
; This leads to an arithmetic error. For example finding A/A where A is the interval (45, 55). This
; should work out to (45 * 1/45, 55 * 1/55) = (1, 1), however what happens instead is
; (45 * 1/55, 55 * 1/45) = (0.8181, 1.2222).
;
; Here are alternate definitions that fix the error. Run this program to compare the output with the
; new and original definitions

(define (lower-bound2 interval)
  (car interval))

(define (upper-bound2 interval)
  (cdr interval))

(define (mul-interval2 x y)
  (let ((p1 (* (lower-bound2 x) (lower-bound2 y)))
        (p2 (* (upper-bound2 x) (upper-bound2 y))))
    (make-interval p1 p2)))

; test

(define i1 (make-center-percent 50 10))

(define i2 (make-interval (/ 1.0 (lower-bound i1))
                          (/ 1.0 (upper-bound i1))))

(display "Interval is: ") i1
(newline)

(display "Using mul-interval and original selectors. Should be (1.0, 1.0): ") (mul-interval i1 i2)
(display "Using mul-interval2 and new selectors. Should be (1.0, 1.0): ") (mul-interval2 i1 i2)

