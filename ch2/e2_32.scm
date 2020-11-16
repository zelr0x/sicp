(define (subsets s)
  (if (null? s)
    '(())
    (let ((rest (subsets (cdr s))))
      (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(display (subsets '(1 2 3))) ;; (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))

