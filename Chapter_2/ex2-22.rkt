#lang sicp

(define (square x) (* x x))

; this definition of square-list produces a list in reverse order because the cons constructor adds
; the first argument (the squared element) to the beginning of the list. Once square-list iterates
; over all the elements in the list, it will end up reversing the order of original list.
;
; cons adding the new element to the beginning of the list is the default behaviour for cons.
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

; Interchanging the arguments to cons doesn't work (it nests each new element within a pair instead)
; because now the first element being added to the list is a list itself, so the list is paired with
; an element, creating a pair instead of a list. In the next iteration the nested pair is then paired
; with an element again, nesting the pairs deeper, and so on for the remaining elements.
;
; This is the default behaviour of cons. cons only adds an element to a list directly if the
; first argument to cons is an element and the second element to cons is a list, otherwise it creates
; pairs.
(define (square-list2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

; test

(square-list (list 2 3 4 5))
(square-list2 (list 2 3 4 5))