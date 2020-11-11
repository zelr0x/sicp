(define (last-pair lst)
  (define (iter last rest)
    (if (null? rest)
        last
        (iter (car rest) (cdr rest))))
  (iter '() lst))

(display (last-pair (list 23 72 149 34))) ;; '(34)

