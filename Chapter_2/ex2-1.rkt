#lang sicp

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

; original solution
; (define (make-rat n d)
;   (let ((g (gcd n d)))
;     (cond ((and (< n 0) (< d 0)) (cons (abs (/ n g)) (abs (/ d g))))
;           ((or (< n 0) (< d 0)) (cons (* -1 (abs (/ n g))) (abs (/ d g))))
;           (else (cons (abs (/ n g)) (abs (/ d g))))) ))

; better solution (from https://sicp-solutions.net/post/sicp-solution-exercise-2-1/):
; note that every ounce of math is worth a pound of computer science, always push yourself to find a
; better solution!

(define (make-rat n d)
  (let ((g (gcd n d))
        (denom-sign (if (< d 0) -1 1)))
    (cons (* (/ n g) denom-sign)
          (* (/ d g) denom-sign)) ))

(define one-third1 (make-rat -1 3))
(define one-third2 (make-rat 1 -3))
(define one-third3 (make-rat -1 -3))
(define one-third4 (make-rat 1 3))

(print-rat one-third1)
(print-rat one-third2)
(print-rat one-third3)
(print-rat one-third4)

