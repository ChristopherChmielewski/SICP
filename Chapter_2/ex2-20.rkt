#lang sicp

(define (same-parity a . b)
  (if (even? a)
      (parity-list even? (cons a b))
      (parity-list odd? (cons a b))
      ))

(define (parity-list test? items)
  (define (iter test? items plist)
    (cond ((null? items) (reverse-list plist))
          ((test? (car items)) (iter test? (cdr items) (cons (car items) plist)))
          (else (iter test? (cdr items) plist))
          ))
  (iter test? items nil))

(define (reverse-list items)
  (define (reverse rlist sublist n)
    (if (null? (cdr sublist))
        (cons (car sublist) rlist)
        (reverse (cons (car sublist) rlist) (cdr sublist) (+ n 1))
        ))
  (reverse (list (car items)) (cdr items) 0))

; test

(same-parity 1 2 3 4 5)
(same-parity 2 3 4 5 6)