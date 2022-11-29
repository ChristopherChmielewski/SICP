#lang sicp

(define tolerance 0.00001)

(define (average x y) (/ (+ x y) 2))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (compose f g)
  (lambda (x) (f (g x)))
  )

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (repeated f n)
  (define (iter n)
    (if (= n 1)
        f
        (compose f (iter (- n 1))
                 )))
  (iter n)
  )

(define (n-avg-damp n)
  (repeated average-damp n)
  )

(define (root x n num-damps)
  (fixed-point ((n-avg-damp num-damps) (lambda (y) (/ x (expt y (- n 1)))))
               1.0))

(define (nth-root x n)
  (define (num-damps n) (floor (log n 2)))
  (root x n (num-damps n)))

; test
(nth-root 4 2)
(nth-root 8 3)
(nth-root 16 4)
(nth-root 32 5)
(nth-root 64 6)
(nth-root 128 7)
(nth-root 256 8)
(nth-root 65536 16)
(nth-root 4294967296 32)

; experimenting
; (newline)

; (display "square root of 4: ") (root 4 2 1) ; square roots
; (display "cube root of 8: ") (root 8 3 1) ; cube roots

; (display "4th root of 16: ") (root 16 4 2) ; 4th roots
; (display "5th root of 32: ") (root 32 5 2) ; 5th roots
; (display "6th root of 64: ") (root 64 6 2) ; 6th roots
; (display "7th root of 128: ") (root 128 7 2) ; 7th roots

; (display "8th root of 256: ") (root 256 8 3) ; 8th roots
; (display "9th root of 512: ") (root 512 9 3) ; 9th roots
; (display "10th root of 1024: ") (root 1024 10 3) ; 10th roots
; (display "11th root of 2048: ") (root 2048 11 3) ; 11th roots
; (display "12th root of 4096: ") (root 4096 12 3) ; 12th roots
; (display "13th root of 8192: ") (root 8192 13 3) ; 13th roots
; (display "14th root of 16384: ") (root 16384 14 3) ; 14th roots
; (display "15th root of 327684: ") (root 32768 15 3) ; 15th roots

; (display "16th root of 65536: ") (root 65536 16 4) ; 16th roots
; (display "17th root of 131072: ") (root 131072 17 4) ; 17th roots
; (display "18th root of 262144: ") (root 262144 18 4) ; 18th roots
; (display "19th root of 524288: ") (root 524288 19 4) ; 19th roots
; (display "20th root of 1048576: ") (root 1048576 20 4) ; 20th roots
; (display "21th root of 2097152: ") (root 2097152 21 4) ; 21th roots
; (display "22th root of 4194304: ") (root 4194304 22 4) ; 22th roots
; (display "23th root of 8388608: ") (root 8388608 23 4) ; 23th roots
; (display "24th root of 16777216: ") (root 16777216 24 4) ; 24th roots
; (display "25th root of 33554432: ") (root 33554432 25 4) ; 25th roots
; (display "26th root of 67108864: ") (root 67108864 26 4) ; 26th roots
; (display "27th root of 134'217'728: ") (root 134217728 27 4) ; 27th roots
; (display "28th root of 268435456: ") (root 268435456 28 4) ; 28th roots
; (display "29th root of 536870912: ") (root 536870912 29 4) ; 29th roots
; (display "30th root of 1073741824: ") (root 1073741824 30 4) ; 30th roots
; (display "31th root of 2147483648: ") (root 2147483648 31 4) ; 31th roots

; (display "32th root of 4294967296: ") (root 4294967296 32 5) ; 32th roots

; (newline)
