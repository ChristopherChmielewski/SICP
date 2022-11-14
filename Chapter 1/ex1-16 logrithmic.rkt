#lang sicp

(define (fe b n)
  (define (even? n)
    (= (remainder n 2) 0)
    )
  (define (fe-iter b n a)
    (cond ((= n 0) a)
          ((even? n) (fe-iter (* b b) (/ n 2) a))
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