#lang sicp

(define (reverse-list items)
  (define (reverse rlist sublist)
    (if (null? (cdr sublist))
        (cons (car sublist) rlist)
        (reverse (cons (car sublist) rlist) (cdr sublist))
        ))
  (reverse (list (car items)) (cdr items))) ; Note on the initial iterative call: see below

; Note on the initial iterative call: trying to cons an element directly to another list creates a
; new list with the element nested as its own list (due to the asymmetry of cons when trying to
; construct a list with a nonlist element). To get around this, the element is wrapped as a list using
; (list (car items)) in the intial iterative call so reverse is always dealing with two lists as
; arguments

(define (deep-reverse items)
  (define (reverse rlist sublist)
    (if (null? (cdr sublist))
        (cons (deep-reverse (car sublist)) rlist)
        (reverse (cons (car sublist) rlist) (cdr sublist))
        ))
  (reverse (wrap-first items) (cdr items))) ; Note on the initial iterative call: see below

(define (wrap-first items) ; a helper for wrapping the first element in items as a list
  (list (car items)))

; test

(define x (list (list 1 2) (list 3 4)))
(define y (list 1 2))

(deep-reverse x)
; (reverse-list y)
; (deep-reverse y)