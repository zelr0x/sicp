;; Example showing that good-enough? function checking
;; that the absolute difference of the radicand and
;; the square of guess is less than tolerance fails for
;; small numbers:
;; (sqrt 0.00005)
;; => 0.009837627222235967
;; expected: 0.00707106781

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
      (avg guess (/ x guess)))
    (if (good-enough?)
      guess
      (sqrt-iter (improve-guess) guess)))
  (sqrt-iter 1.0 -1.0))

(display (sqrt 0.00005))

