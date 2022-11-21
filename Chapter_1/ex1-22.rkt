#lang sicp

(define (square x) (* x x))

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (check-prime n c)
  (cond ((and (prime? n) (< c 3)) (timed-prime-test n) (check-prime (+ n 2) (+ c 1)))
        ((< c 3) (check-prime (+ n 2) c))
        ))

(define (search-for-primes start-num)
  (if (even? start-num)
      (check-prime (+ start-num 1) 0)
      (check-prime start-num 0)
      ))

(search-for-primes 10000000)
(newline)
(search-for-primes 100000000)
(newline)
(search-for-primes 1000000000)