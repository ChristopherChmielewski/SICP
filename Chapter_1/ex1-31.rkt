#lang sicp

; iterative product
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

; recursive product
(define (product-rec term a next b)
  (if (> a b)
      1
      (* (term a) (product-rec term (next a) next b))))

; factorial
(define (factorial n)
  (define (inc n) (+ n 1))
  (define (identity x) x)
  (product identity 1 inc n))

; (factorial 0)
; (factorial 1)
; (factorial 2)
; (factorial 3)
; (factorial 4)
; (factorial 5)

; Wallis product to approximate pi, using product given in text
(define (wallis-product n)
  (define (inc2 n) (+ n 2))
  (define (square x) (* x x))
  (* 4.0 (/ (* 2 (product square 4 inc2 (+ (* 2 n) 2)) (+ (* 2 n) 4)) (product square 3 inc2 (+ (* 2 (+ n 1)) 2))))
  )

; Wallis product to approximate pi, using formula from Wikipedia https://en.wikipedia.org/wiki/Wallis_product
(define (wallis2 n)
  (define (inc n) (+ n 1))
  (define (term n)
    (* (/ (* 2.0 n) (- (* 2 n) 1)) (/ (* 2 n) (+ (* 2 n) 1)))
    )
  (* 2 (product term 1 inc n))
  )

; test
; (wallis-product 1)
; (wallis-product 2)
; (wallis-product 3)
; (wallis-product 4)
; (wallis-product 5)
; (wallis-product 6)
; (wallis-product 7)
; (wallis-product 8)
; (wallis-product 9)
; (wallis-product 10)
; (wallis-product 100)
; (wallis-product 1000)

(wallis2 1)
(wallis2 10)
(wallis2 100)
(wallis2 1000)
(wallis2 10000)
(wallis2 100000)
(wallis2 1000000)

