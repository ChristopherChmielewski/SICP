#lang sicp

(define (square x) (* x x))

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 5)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (check-prime n c)
  (cond ((and (fast-prime? n 5) (< c 3)) (timed-prime-test n) (check-prime (+ n 2) (+ c 1)))
        ((< c 3) (check-prime (+ n 2) c))
        ))

(define (search-for-primes start-num)
  (if (even? start-num)
      (check-prime (+ start-num 1) 0)
      (check-prime start-num 0)
      ))

; (search-for-primes 10000000)
; (newline)
; (search-for-primes 100000000)
; (newline)
; (search-for-primes 1000000000)

(search-for-primes 1000)
(newline)
(search-for-primes 1000000)