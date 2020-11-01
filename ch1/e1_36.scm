(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (xx x)
  (fixed-point (lambda (y) (/ (log x) (log y)))
               2.0))
(define (average a b) (/ (+ a b) 2))
(define (xx-ad x)
  (fixed-point (lambda (y) (average y (/ (log x) (log y))))
               2.0))

(display (xx-ad 1000))

