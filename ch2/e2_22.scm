(define (square x) (* x x))

(define (square-list items)
  (define (iter things answer)
    (display answer)
    (newline)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                     answer))))
  (iter items '()))

(display (square-list (list 1 2 3 4)))

(define (square-list items)
  (define (iter things answer)
    (display answer)
    (newline)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items '()))

(display (square-list (list 1 2 3 4)))

