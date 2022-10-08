; Exercise 1.1 Page 42

; A recursive process to compute the recurrance relation
(define (fn n) 
  (if (< n 3)
    n
    (+ (fn (- n 1)) (* 2 (fn (- n 2))) (* 3 (fn (- n 3))))))