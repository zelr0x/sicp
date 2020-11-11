(define (append list1 list2)
  (if (null? list1)
    list2
    (cons (car list1) (append (cdr list1) list2))))

(define squares (list 1 4 9 16 25))
(define odds (list 1 3 5 7))
(display (append squares odds)) ;; '(1 4 9 16 25 1 3 5 7)
(newline)
(display (append odds squares)) ;; '(1 3 5 7 1 4 9 16 25)

