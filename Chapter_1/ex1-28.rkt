#lang sicp

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

(display "Carmichael Numbers")
(newline)
(fast-prime? 561 100)
(fast-prime? 1105 100)
(fast-prime? 1729 100)
(fast-prime? 2465 100)
(fast-prime? 2821 100)
(fast-prime? 6601 100)
(display "Prime Numbers")
(newline)
(fast-prime? 7 100)
(fast-prime? 11 100)
(fast-prime? 13 100)
(fast-prime? 17 100)
(fast-prime? 19 100)
(fast-prime? 23 100)
(display "Nonprime Numbers")
(newline)
(fast-prime? 4 100)
(fast-prime? 6 100)
(fast-prime? 10 100)
(fast-prime? 100 100)
(fast-prime? 755 100)
(fast-prime? 1234 100)
(fast-prime? 2020 100)
(fast-prime? 1000000000 100)










