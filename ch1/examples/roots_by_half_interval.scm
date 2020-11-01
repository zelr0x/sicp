(define (average a b)
  (/ (+ a b) 2))

(define (search f neg pos)
  (define (close-enough? x y)
    (< (abs (- x y)) 0.001))
  (let ((mid (average neg pos)))
    (if (close-enough? neg pos)
      mid
      (let ((test-value (f mid)))
        (cond ((positive? test-value)
               (search f neg mid))
              ((negative? test-value)
               (search f mid pos))
              (else mid))))))

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (search f a b))
          ((and (negative? b-value) (positive? a-value))
           (search f b a))
          (else
           (error "Values are not of opposite sign" a b)))))

(display (half-interval-method sin 2.0 4.0)) ; ~PI
(newline)
(display (half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3))
         1.0
         2.0))
(newline)

