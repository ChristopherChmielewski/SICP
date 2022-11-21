#lang sicp

(define (expmod-slow base exp m)
  (remainder (fast-expt base exp) m))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (square x) (* x x))

(define (report-time start-time end-time prefix-text)
  (display prefix-text)
  (display "elapsed time: ")
  (display (- end-time start-time))
  (newline)
  )

(define (em b e m start-time)
  (expmod b e m)
  (report-time start-time (runtime) "expmod ")
  (expmod-slow b e m)
  (report-time start-time (runtime) "expmod-slow ")
  )

(em 2 100000000 77 (runtime))

; Answer
; Alyssa P. Hacker is not correct, expmod-slow takes the remainder of potentionally a very large number
; whereas expmod reduces and takes the remainder successively, taking a series of smaller remainders,
; which will execute much faster. For example finding 2^100000000 mod 77 using expmod takes 4 ms,
; whereas with expmod-slow it takes 86978

