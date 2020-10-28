(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ (term a) result))))
  (iter a 0))

(define (cube x) (* x x x))
(define (inc x) (+ 1 x))
(define (sum-cubes a b)
  (sum cube a inc b))

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(display (sum-cubes 1 10)) ; 3025 expected
(newline)
(display (* 8 (pi-sum 1 1000))) ; approx. PI expected
(newline)
(display (integral cube 0 1 0.01)) ; ~0.25
(newline)

