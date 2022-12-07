#lang sicp

; See rules for encoding Church numerals https://en.wikipedia.org/wiki/Church_encoding#Church_numerals.
; Also see https://stackoverflow.com/questions/1481950/church-numerals-how-to-encode-zero-in-lambda-calculus

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

; using the lambda calculus definition of addition of m and n:
; "Because the m-th composition of f composed with the n-th composition of f gives the m+n-th composition of f, addition can be defined as follows:
; PLUS := λm.λn.λf.λx.m f (n f x)"
; (see https://en.wikipedia.org/wiki/Lambda_calculus#Arithmetic_in_lambda_calculus)

(define (+ m n)
  (lambda (f)
    (lambda (x)
      ((m f) ((n f) x)) )))