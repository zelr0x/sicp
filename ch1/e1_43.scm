(define (square x) (* x x))
(define (inc x) (+ x 1))
(define (dec x) (- x 1))

(define (compose g f)
  (lambda (x) (g (f x))))

(define (repeated f n)
  (if (= n 1)
      f
      (repeated (compose f f) (dec n))))

(display ((repeated square 2) 5)) ; 625

