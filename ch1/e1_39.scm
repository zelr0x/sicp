(define (inc x) (+ x 1))
(define (dec x) (- x 1))
(define (square x) (* x x))

(define (cont-frac n d k)
  (define (iter acc i)
    (if (= i k)
        acc
        (iter (/ (n i) 
                 (+ acc (d i)))
              (inc i))))
  (iter 0.0 0))

(define (tan-cf x k)
  ;; x is in radians
  (let ((neg-x-sq (- (square x))))
    (cont-frac (lambda (i) (if (= i 1) x neg-x-sq))
               (lambda (i) (dec (* 2 i)))
               k)))

