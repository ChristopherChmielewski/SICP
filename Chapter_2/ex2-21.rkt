#lang sicp

(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list (cdr items)))))

(define (square x) (* x x))

(define (square-list2 items)
  (map square items))

; test

(square-list (list 2 3 4 5))
(square-list2 (list 2 3 4 5))