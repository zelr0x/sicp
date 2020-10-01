(define (initial-guess) 1.0)
(define (tolerance) 0.0001)

(define (avg x y)
  (/ (+ x y) 2))

(define (sq x)
  (* x x))

(define (abs x)
  (if (< x 0)
    (- x)
    x))

(define (sqrt x)
  (define (sqrt-iter guess)
    (define (good-enough?)
      (< (abs (- x (sq guess))) (tolerance)))
    (define (improve-guess)
      (avg guess (/ x guess)))
    (if (good-enough?)
      guess
      (sqrt-iter (improve-guess))))
  (sqrt-iter (initial-guess)))

(display (sqrt 4))

