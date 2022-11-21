#lang sicp

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m))  m))))

; Answer
; The reason that using an explict multiplication instead of square tranforms the process from
; big-theta(log n) to big-theta(n) is because expmod is evaluated twice and then multiplied together
; at each level of recursion instead of being evaluated once and then the result squared at each level
; of recursion. The process is also converted to a binary-tree recursive process which adds a lot of
; redundant computations of expmod. The time complexity becomes big-theta(log 2^n) - big-theta(nlog 2)
; = big-theta(n) since the work is doubled at each level of recursion