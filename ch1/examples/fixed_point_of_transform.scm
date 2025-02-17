(define (square x) (* x x))

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

(define (average a b) (/ (+ a b) 2))
(define (average-damp f)
  (lambda (x) (average x (f x))))

(define dx 0.00001)
(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))
(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (sqrt-avg-damp x)
  (fixed-point-of-transform
   (lambda (y) (/ x y)) average-damp 1.0))

(define (sqrt-newton x)
  (fixed-point-of-transform
   (lambda (y) (- (square y) x)) newton-transform 1.0))

(display (sqrt-avg-damp 2))
(newline)
(display (sqrt-newton 2))

