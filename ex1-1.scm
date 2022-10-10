; Exercise 1.1 Page 42

; A recursive process to compute the recurrance relation
(define (fn-rec n) 
  (if (< n 3)
    n
    (+ (fn-rec (- n 1)) (* 2 (fn (- n 2))) (* 3 (fn (- n 3))))))

; A iterative process to compute the recurrance relation
(define (fn n)
  (fn-iter 2 1 0 n))

(define (fn-iter a b c count)
  (cond ((and (< count 3) (= a 2)) count) ; term. condition if inital value of n is < 3
        ((< count 3) a) ; term. condition if count > 2
        (else (fn-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))) ; else iterate until count reaches term. con.
  ))

; block scoped iterative version
(define (fn n)
  (define (fn-iter a b c count)
  (cond ((and (< count 3) (= a 2)) count) ; term. condition if inital value of n is < 3
        ((< count 3) a) ; term. condition if count > 2
        (else (fn-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))) ; else iterate until count reaches term. con.
  ))
  (fn-iter 2 1 0 n))