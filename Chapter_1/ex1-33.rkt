#lang sicp

(define (filtered-accumulate combiner filter null-value term a next b)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a) (filtered-accumulate combiner filter null-value term (next a) next b)) ; combine and accumulate next term
          (filtered-accumulate combiner filter null-value term (next a) next b) ; do not combine current term, accumulate next term
          )
      )
  )

(define (filtered-accumulate-iter combiner filter null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (if (filter a)
            (iter (next a) (combiner result (term a))) ; combine and accumulate next term
            (iter (next a) result) ; do not combine current term, pass through result instead. Accumulate next term
            )
        )
    )
  (iter a null-value)
  )

; prime number related functions
(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (nontrival-sqrt (remainder (square (expmod base (/ exp 2) m)) m) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))
        ))

(define (square x) (* x x))

(define (nontrival-sqrt x m)
  ; returns 0 if x is a nontrival square root
  (if (and (not (= x 1)) (not (= x (- m 1))) (= (remainder (square x) m) 1))
      0
      x
      )
  )

; helpers
(define (cube x) (* x x x))
(define (inc n) (+ n 1))
(define (prime? n)
  (cond ((= n 0) false)
        ((= n 1) true)
        (else (fast-prime? n 100))))
(define (return-true a) true)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (relatively-prime? a b)
  (if (= (gcd a b) 1)
      true
      false))

(define (product-relatively-prime n)
  (define (r-prime-to-n? a) (relatively-prime? a n))
  (filtered-accumulate-iter * r-prime-to-n? 1 identity 1 inc (- n 1))
  )

; test
; (filtered-accumulate-iter + return-true 0 cube 0 inc 10) ; sum of cubes
(filtered-accumulate + prime? 0 square 0 inc 20) ; sum of squares of primes
(filtered-accumulate-iter + prime? 0 square 0 inc 20) ; sum of squares of primes
(product-relatively-prime 10) ; product of postive integers less than n that are relatively prime to n