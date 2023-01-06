#lang sicp

(define (deep-reverse lt)
  (define (reverse sublist rlist)
    (cond ((null? sublist) rlist)
          ((not (pair? (car sublist))) (reverse (cdr sublist) (add-to-rlist (car sublist) rlist)))
          ((pair? (car sublist))
           (reverse (cdr sublist) (add-to-rlist (deep-reverse (car sublist)) rlist))
           )
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