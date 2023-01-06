#lang sicp

(define (deep-reverse items)
  (define (reverse sublist rlist)
    (cond ((not (pair? sublist)) (cons sublist rlist))
          ((and (null? (cdr sublist)) (pair? sublist)) (reverse (car sublist) rlist))
          ((null? (cdr sublist)) (cons (car sublist) rlist))
          ((pair? (car sublist))
           (reverse (cdr sublist) (reverse (car sublist) rlist))  ; (reverse (3 4) (reverse (1 2) nil))
           )
          (else (cons (reverse (cdr sublist) (cons (car sublist) nil)) rlist))
          ))
  (reverse items nil))

; test

(define x (list (list 1 2) (list 3 4)))
(define y (list (list (list 1 2) 3) (list 4 5)))
(define z (list 1 2 3 (list 4 5)))

(deep-reverse x)