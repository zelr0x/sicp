(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
          (if (null? rest)
              result
              (iter (op result (car rest))
                    (cdr rest))))
      (iter initial sequence))

(define (reverse seq)
  (fold-right (lambda (x acc) (append acc (list x))) '() seq))

(define s '(1 2 3 4 5))
(display (reverse s))

(define (reverse seq)
  (fold-left (lambda (acc x) (cons x acc)) '() seq))

(newline)
(display (reverse s))

