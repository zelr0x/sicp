(define (enumerate-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (constantly x) (lambda (ignored) x))

(define (count-leaves tree)
  (accumulate + 0 (map (constantly 1) (enumerate-tree tree))))

(define x (cons (list 1 2) (list 3 4)))
(display (count-leaves (list x x))) ;; 8

