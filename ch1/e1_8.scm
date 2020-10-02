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
  (define (sqrt-iter guess prev-guess)
    (define (good-enough?)
      (< (abs (- guess prev-guess)) (tolerance)))
    (define (improve-guess)
      (/ (+ (/ x (sq guess)) (* 2 guess)) 3))
    (if (good-enough?)
      guess
      (sqrt-iter (improve-guess) guess)))
  (sqrt-iter 1.0 -1.0))

(display (sqrt 27))

