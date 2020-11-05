(define (dec x) (- x 1))
(define (square x) (* x x))
(define (average a b) (/ (+ a b) 2))
(define (compose g f)
  (lambda (x) (g (f x))))
(define (even? n)
  (= 0 (remainder n 2)))
(define (pow b n)
  (cond ((= n 0) 1)
        ((even? n) (square (pow b (/ n 2))))
        (else (* b (pow b (- n 1))))))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))
(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (repeated f n)
  (if (= n 1)
      f
      (repeated (compose f f) (dec n))))

(define (root n x)
  (if (< n 2)
    x
    (let ((prev-n (dec n)))
      (fixed-point-of-transform
       (lambda (y) (/ x (pow y prev-n))) (repeated average-damp prev-n) 1.0))))

(define (sqrt x) (root 2 x))
(define (cubert x) (root 3 x))
(define (quadrt x) (root 4 x))

(display (sqrt 25))
(newline)
(display (cubert 125))
(newline)
(display (quadrt 625))
(newline)
(display (quadrt 3125))
(newline)

