(define (cube x) (* x x x))
(define (inc x) (+ x 1))
(define (id x) x)

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (sum-cubes a b)
  (sum cube a inc b))

(define (sum-integers a b)
  (sum id a inc b))

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
(display (sum-integers 1 10)) ; 55 expected
(newline)
(display (* 8 (pi-sum 1 1000))) ; approx. PI expected
(newline)
(display (integral cube 0 1 0.01)) ; ~0.25
(newline)

