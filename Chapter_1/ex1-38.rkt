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

; 1,2,1,1,4,1,1,6,1,1,8

(define (seq n)
  (define (seq-for-n>1 n)
    (cond ((= (remainder n 3) 1) (* 2 (/ (+ n 2) 3)))
          (else 1)))
  (if (= n 1)
      1
      (seq-for-n>1 (- n 1))))

; (seq 1.0)
; (seq 2.0)
; (seq 3.0)
; (seq 4.0)
; (seq 5.0)
; (seq 6.0)
; (seq 7.0)
; (seq 8.0)
; (seq 9.0)
; (seq 10.0)
; (seq 11.0)

(define (e n)
  (+ 2 (cont-frac-iter (lambda (i) 1.0)
                       seq
                       n
                       )))

(e 1000)