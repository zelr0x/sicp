(define (square x) (* x x))
(define (inc x) (+ x 1))

(define (compose g f)
  (lambda (x) (g (f x))))

(display ((compose square inc) 6)) ; 49

