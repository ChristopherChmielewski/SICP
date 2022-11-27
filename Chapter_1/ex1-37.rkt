#lang racket/base
(require racket/trace)

(define (cont-frac-recur n d k)
  (define (recur n d k j)
    (if (= j k)
        (d k)
        (+ (d j) (/ (n (+ j 1)) (recur n d k (+ j 1))))
        ))
  (/ (n 1) (recur n d k 1))
  )

(define (cont-frac-iter n d k)
  (define (iter j result)
    (if (= j k)
        result
        (+ (d j) (/ (n (+ j 1)) (iter (+ j 1) result)))
        )
    )
  (/ (n 1) (iter 1 (d k)))
  )


(newline)
(display "trace: cont-frac-recur") (newline)
(trace cont-frac-recur)
(cont-frac-recur (lambda (i) 1.0)
                 (lambda (i) 1.0)
                 11)
(newline)

(display "trace: cont-frac-iter") (newline)
(trace cont-frac-iter)
(cont-frac-iter (lambda (i) 1.0)
                (lambda (i) 1.0)
                11)
(newline)