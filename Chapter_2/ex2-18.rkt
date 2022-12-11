#lang sicp

(define (reverse-list items)
  (define (reverse rlist sublist n)
    (if (null? (cdr sublist))
        (cons (car sublist) rlist)
        (reverse (cons (car sublist) rlist) (cdr sublist) (+ n 1))
        ))
  (reverse (list (car items)) (cdr items)) 0) ; Note on the initial iterative call: see below

; Note on the initial iterative call: trying to cons an element directly to another list creates a
; new list with the element nested as its own list (due to the asymmetry of cons when trying to
; construct a list with a nonlist element). To get around this, the element is wrapped as a list using
; (list (car items)) in the intial iterative call so reverse is always dealing with two lists as
; arguments

; test

(reverse-list (list 1 2 3 4))