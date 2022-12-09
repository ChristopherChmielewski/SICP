#lang sicp

; In general, different but equivalent algebraic expressions may lead to different results because
; the interval-arithmetic system applies tolerances at each operation, therefore accumulating error
; the more operations that are performed. If different but equivalent algebraic expressions perform
; a different number of operations on the intervals, they will get different answers.
;
; An interval-arithmetic package could be devised that does not have this shortcoming. It would
; require doing all the arithmetic on the nominal value of the interval (i.e. the center value) and
; then only applying a tolerance at the end. However, if a newly calculated interval was to be used
; in another calculation, then the nominal value without the tolerance would have to be used.
; Therefore our data structure would have to keep track of the tolerances as they are combined but
; only apply them at the end as the last step, and then provide an interval's center value if
; subsequent operations are to be performed.