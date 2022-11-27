#lang sicp

(define (cont-frac-iter n d k)
  (define (iter j result)
    (if (= j k)
        result
        (+ (d j) (/ (n (+ j 1)) (iter (+ j 1) result)))
        )
    )
  (/ (n 1) (iter 1 (d k)))
  )

(define (tan-cf x k)
  (define (n i)
    (if (= i 1)
        x
        (* -1 x x)))
  (cont-frac-iter n (lambda (n) (- (* 2 n) 1)) k)
  )

(tan-cf 2.0 12)
(tan 2.0)