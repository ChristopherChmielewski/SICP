#lang sicp

(define (square x) (* x x))

(define (fast-expt b n) ;for testing purposes
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (fe b n)
  (newline)
  (display b) (display "^") (display n) (display " = ") (display (fast-expt b n)) (display " --------") (newline) (newline)
  (display "n") (display "  ") (display "a") (display "  ") (display "b") (display "  ") (display "a(b^n)") (newline)
  (display "-") (display "  ") (display "-") (display "  ") (display "-") (display "  ") (display "------") (newline)
  (define (even? n)
    (= (remainder n 2) 0)
    )
  (define (fe-iter b n a)
    (display n) (display ", ") (display a) (display ", ") (display b) (display ", ") (display (* a (fast-expt b n))) (newline)
    (cond ((= n 0) a)
          ((even? n) (fe-iter b (- n 2) (* a b b)))
          (else (fe-iter b (- n 1) (* a b)))
          ))
  (fe-iter b n 1)
  )

; test
(fe 2 0)
(fe 2 1)
(fe 2 2)
(fe 2 3)
(fe 2 4)
(fe 2 5)
(fe 2 6)
(fe 2 7)
(fe 2 8)
