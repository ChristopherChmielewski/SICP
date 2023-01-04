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

; (define (deep-reverse items)
;   (if (not (pair? items))
;       items
;       (reverse (wrap-first items) (cdr items))))

; (define (reverse rlist sublist)
;   (if (null? (cdr sublist))
;       (cons (car sublist) rlist)  ; base case
;       (reverse (cons (car sublist) rlist) (cdr sublist)) )) ; reduction step

; (define (reverse_first_element sublist)
;   (if (pair? (car sublist))
;       (cons (reverse (wrap-first (car sublist)) (cdr (car sublist))) (cdr sublist))
;       sublist
;       ))

; (define (deep-reverse tree)

;   )

(define (reverse-leaves branch)
  (if (pair? (car branch))
      (cons (reverse-leaves (car branch)) (cdr branch)) ; reduction step, go down the branch
      (cons (car (cdr branch)) (list (car branch)))  ; base case, we've reached a pair of leaves, so reverse them
      ))

(define (reverse-branches tree)
  (define (reverse-branch rtree subtree)
    (if (null? (cdr subtree))
        (cons (car subtree) rtree) ; base case, no more branches
        (reverse-branch (cons (car subtree) rtree) (cdr subtree)) )) ; reduction step, reverse the branches and iterate to next branch
  (reverse-branch (list (car tree)) (cdr tree)))

; test

(define x (list (list 1 2) (list 3 4)))
(define y (list 1 2))
(define z (list (list 1 (list 2 3)) (list (list 4 5) 6)))

; (reverse-branches x)
; (reverse-branches y)
; (reverse-branches z)

; (newline)

(reverse-leaves x)
(reverse-leaves y)
(reverse-leaves z)