#lang sicp

(define (cube x) (* x x x))

(define (p x)
  (- (* 3 x) (* 4 (cube x)))
  )

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(sine 12.15)

(p (sine 4.05))
(p (p (sine 1.35)))
(p (p (p (sine 0.45))))
(p (p (p (p (sine 0.15)))))
(p (p (p (p (p (sine 0.05))))))
(p (p (p (p (p 0.05)))))

; solution from https://sicp-solutions.net/post/sicp-solution-exercise-1-15/

; (define (cube x) (* x x x))

; (define (p x) (- (* 3 x) (* 4 (cube x))))

; (define (sine angle step)
;   (display step) (display ": ") (display angle) (newline)
;    (if (not (> (abs angle) 0.1))
;        angle
;        (p (sine (/ angle 3.0) (+ step 1)))))

; (display (sine 12.15 1))