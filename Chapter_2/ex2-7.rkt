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

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval
   x
   (make-interval (/ 1.0 (upper-bound y))
                  (/ 1.0 (lower-bound y)))))

; test

(define i1 (make-interval 1 2))
(define i2 (make-interval 4 3))

(lower-bound i1)
(upper-bound i1)

(lower-bound i2)
(upper-bound i2)