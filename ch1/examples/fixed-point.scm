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

;(display (fixed-point cos 1.0)) ; 0.7390822985224023
;(newline)
;(display (fixed-point (lambda (y) (+ (sin y) (cos y)))
;                      1.0)) ; 1.2587315962971173

(define (average a b) (/ (+ a b) 2))
(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))

(display (sqrt 25))

