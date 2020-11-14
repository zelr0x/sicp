(define (fringe items)  
  (define (iter acc rest) 
    (cond ((null? rest) acc) 
          ((pair? rest)
           (iter (iter acc (cdr rest)) (car rest)))
          (else (cons rest acc))))
   (iter '() items))

(define x (list (list 1 2) (list 3 4)))
(display (fringe x)) ;; (1 2 3 4)
(newline)
(display (fringe (list x x))) ;; (1 2 3 4 1 2 3 4)

