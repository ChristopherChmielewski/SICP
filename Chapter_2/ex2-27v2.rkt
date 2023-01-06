#lang sicp

(define (reverse sublist rlist)
  (cond ((end-of-list? sublist) rlist)
        ((is-leaf? sublist)
         (cons (car sublist) rlist)
         )
        (else
         (cons (reverse (car sublist) nil) rlist)
         )
        ))

(define (end-of-list? sublist)
  (if (null? (cdr sublist))
      true
      false
      ))

(define (is-leaf? element)
  (if (not (pair? element))
      true
      false
      )
  )

(define (get-last-element sublist)
  (if (null? (cdr sublist))
      sublist
      (get-last-element (cdr sublist))
      )
  )

; test

; (end-of-list? (list 1))
; (end-of-list? (list 1 2))
; (is-leaf? 1)
; (is-leaf? (list 1))
; (get-last-element (list 1))
; (get-last-element (list 1 2))
; (get-last-element (list 1 2 (list 3 4)))

(define x (list (list 1 2) (list 3 4)))
(define y (list 1 2))
(define z (list (list 1 (list 2 3)) (list (list 4 5) 6)))

(reverse x nil)
; (reverse y nil)
; (reverse z nil)