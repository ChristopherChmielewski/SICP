#lang sicp

; Reductions steps and base case
; Reduction step 1: if element is a pair, call fringe on element passing the element and flist
; (fringe list) as args, and go to next element
; Reduction step 2: if element is not a pair, append element to flist and go to next element
;   Note: (use "(append flist element)") so that each element is added to the end of flist so that
;   the final result is in left to right order
; Base case: if element is empty list, return flist

(define (fringe lt)
  (define (fringe-iter lt flist)
    (cond ((null? lt) flist)
          ((pair? (car lt))
           (fringe-iter (cdr lt) (fringe-iter (car lt) flist)))
          ((not (pair? (car lt)))
           (fringe-iter (cdr lt) (append flist (list (car lt))))
           ))
    )
  (fringe-iter lt nil))

; test

(define a (list (list 1 2) (list 3 4)))
(define b (list 1 (list 2 3)))
(define c (list 1 2 3 4 (list 5 6 (list 7 8 (list 9 10 (list 11 12 (list (list 13 14))))))))
(define d (list (list 1 (list 2 3 (list 4 5))) (list 6 7)))

(fringe a)
(fringe b)
(fringe c)
(fringe d)
