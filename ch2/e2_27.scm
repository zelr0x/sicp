(define (deep-reverse lst)
  (define (iter acc rest)
    (cond ((null? rest) acc)
          ((pair? (car rest))
           (iter (cons (reverse (car rest)) acc) (cdr rest)))
          (else 
            (iter (cons (car rest) acc) (cdr rest)))))
  (iter '() lst))

(define x (list (list 1 2) (list 3 4)))
(display (deep-reverse x))

