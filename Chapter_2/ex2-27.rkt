#lang sicp

; Reduction rules and base case
; Reduction rule 1: if element is not a pair, add to reverse list (rlist) and go to next element
; Reduction rule 2: if element is a pair, reverse the element, add the element to rlist, and go to next element
; Base case: if list is an empty list then return the rlist

(define (deep-reverse lt)
  (define (reverse sublist rlist)
    (cond ((null? sublist) rlist) ; base case: list is an empty list
          ((not (pair? (car sublist))) (reverse (cdr sublist) (add-to-rlist (car sublist) rlist)))  ; reduction step for non-pair elements (rule 1)
          ((pair? (car sublist))
           (reverse (cdr sublist) (add-to-rlist (deep-reverse (car sublist)) rlist))
           ) ; reduction step for elements that are themselves pairs (i.e. nested lists) (rule 2)
          ))
  (reverse lt nil)
  )

(define (add-to-rlist element rlist)
  (cons element rlist))

; test

(define a (list 1 2 3 4))
(define b (list (list 1 2)))
(define c (list (list 1 2) (list 3 4)))
(define d (list 1 (list 2 3)))
(define e (list 1 2 3 4 (list 5 6 (list 7 8 (list 9 10 (list 11 12 (list (list 13 14))))))))
(define f (list (list 1 (list 2 3)) 4 (list 5 6 (list 7 8 (list 9 10 (list 11 12 (list (list 13 14))))))))

a
(deep-reverse a)
(newline)

b
(deep-reverse b)
(newline)

c
(deep-reverse c)
(newline)

d
(deep-reverse d)
(newline)

e
(deep-reverse e)
(newline)

f
(deep-reverse f)
(newline)