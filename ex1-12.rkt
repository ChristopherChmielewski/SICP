#lang scheme

; General formula for Pascal's triangle: p(r, c) = p(r - 1, c -1) + p(r - 1 , c) where r is row and c
; is column. Use initial conditions (1, 1) = (2, 1) = (2, 2) = (3, 1) = 1

(define (pt r c)
  (cond ((or (= r 0) (= c 0)) 0)
        ((or (and (<= r 3) (<= c 1)) (and (= r 2) (= c 2))) 1)
        ((< r c) 0)
        (else (+ (pt (- r 1) (- c 1)) (pt (- r 1) c)))
        ))

; from SICP solutions http://community.schemewiki.org/?sicp-ex-1.12

(define (pascal r c)
  (if (or (= c 1) (= c r))
      1
      (+ (pascal (- r 1) (- c 1)) (pascal (- r 1) c))))

; test

(display "      ") (display (pt 1 1)) (newline)
(display "     ") (display (pt 2 1)) (display " ") (display (pt 2 2)) (newline)
(display "    ") (display (pt 3 1)) (display " ") (display (pt 3 2)) (display " ") (display (pt 3 3)) (newline)
(display "   ") (display (pt 4 1)) (display " ") (display (pt 4 2)) (display " ") (display (pt 4 3)) (display " ") (display (pt 4 4)) (newline)
(display "  ") (display (pt 5 1)) (display " ") (display (pt 5 2)) (display " ") (display (pt 5 3)) (display " ") (display (pt 5 4)) (display " ") (display (pt 5 5)) (newline)
(display (pt 6 1)) (display " ") (display (pt 6 2)) (display " ") (display (pt 6 3)) (display " ") (display (pt 6 4)) (display " ") (display (pt 6 5)) (display " ") (display (pt 6 6)) (newline)

; test
(display "      ") (display (pascal 1 1)) (newline)
(display "     ") (display (pascal 2 1)) (display " ") (display (pascal 2 2)) (newline)
(display "    ") (display (pascal 3 1)) (display " ") (display (pascal 3 2)) (display " ") (display (pascal 3 3)) (newline)
(display "   ") (display (pascal 4 1)) (display " ") (display (pascal 4 2)) (display " ") (display (pascal 4 3)) (display " ") (display (pascal 4 4)) (newline)
(display "  ") (display (pascal 5 1)) (display " ") (display (pascal 5 2)) (display " ") (display (pascal 5 3)) (display " ") (display (pascal 5 4)) (display " ") (display (pascal 5 5)) (newline)
(display (pascal 6 1)) (display " ") (display (pascal 6 2)) (display " ") (display (pascal 6 3)) (display " ") (display (pascal 6 4)) (display " ") (display (pascal 6 5)) (display " ") (display (pascal 6 6)) (newline)