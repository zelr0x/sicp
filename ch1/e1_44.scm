(define (square x) (* x x))
(define (inc x) (+ x 1))
(define (dec x) (- x 1))
(define (average a b c) (/ (+ a b c) 3))

(define (compose g f)
  (lambda (x) (g (f x))))

(define (repeated f n)
  (if (= n 1)
      f
      (repeated (compose f f) (dec n))))

(define dx 0.00001)
(define (smooth f)
  (lambda (x) (average
                (f (- x dx))
                (f x)
                (f (+ x dx)))))
(define (smooth-n-fold f n)
  (repeated smooth n) f)

