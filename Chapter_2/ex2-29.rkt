#lang sicp

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))

(define (is-mobile? structure)
  (if (null? structure)
      false
      (not (null? (cdr structure)))
      )
  )

(define (get-weight structure)
  (car structure))

; total-weight base case and reduction steps
; base case: if branch is null then return weight
; reduction step 1: if structure of branch is a mobile, then apply total-weight to structure, and
;   add to weight
; reduction step 2: if structure of branch is not a mobile (i.e. it is a weight), then add structure
;   to weight

(define (total-weight mobile)
  (define (total-weight-iter branch weight)
    (cond ((null? branch) weight)
          ((is-mobile? (branch-structure branch))
           (+ (total-weight (branch-structure branch)) weight))
          ((not (is-mobile? (branch-structure branch)))
           (+ (get-weight (branch-structure branch)) weight))
          )
    )
  (+ (total-weight-iter (left-branch mobile) 0) (total-weight-iter (right-branch mobile) 0))
  )

; test

(define branch-1 (make-branch 5 5))
(define branch-2 (make-branch 5 5))

(define mobile-1 (make-mobile branch-1 branch-2))

(define branch-3 (make-branch 5 mobile-1))
(define mobile-2 (make-mobile branch-1 branch-3))

mobile-1
(total-weight mobile-1)
(newline)
mobile-2
(total-weight mobile-2)
