(define (reverse lst)
  (define (iter acc rest)
    (if (null? rest)
        acc
        (iter (cons (car rest) acc) (cdr rest))))
  (iter '() lst))

(define squares '(1 4 9 16 25))
(display (reverse squares))

