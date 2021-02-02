(define (equal? a b)
  (if (and (list? a) (list? b))
    (and (equal? (car a) (car b))
         (equal? (cdr a) (cdr b)))
    (eq? a b)))

(display (equal? '(this is a list) '(this is a list)))
(newline)
(display (equal? '(this is a list) '(this (is a) list)))

