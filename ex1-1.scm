; Exercise 1.1 Page 42

; A recursive process to compute the recurrance relation
(define (fn-rec n) 
  (if (< n 3)
    n
    (+ (fn (- n 1)) (* 2 (fn (- n 2))) (* 3 (fn (- n 3))))))


(define (fn n)
  (fn-iter 2 1 0 n))

(define (fn-iter a b c count)
  (if (< count 3)
    (+ a (* 2 b) (* 3 c))
    (fn-iter (- a 1) (- b 2) (- c 3) (- count 1))
  ))