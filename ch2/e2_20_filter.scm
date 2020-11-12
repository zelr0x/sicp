(define (filter pred coll)
  (define (iter acc coll)
    (if (null? coll)
        acc
        (let ((x (car coll))
              (tail (cdr coll)))
          (if (pred x)
              (iter (append acc (list x)) tail)
              (iter acc tail)))))
  (iter '() coll))

(define (same-parity arg . args)
  (let ((pred (if (even? arg) even? odd?)))
    (cons arg (filter pred args))))

(display (same-parity 1 2 3 4 5 6 7)) ;; '(1 3 5 7)
(newline)
(display (same-parity 2 3 4 5 6 7)) ;; '(2 4 6)

