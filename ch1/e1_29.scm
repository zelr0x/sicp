(define (cube x) (* x x x))
(define (inc x) (+ x 1))

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (sum-cubes a b)
  (sum cube a inc b))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (integral-simpson f a b n)
  (define h (/ (- b a) n))
  (define (term k)
    (define y (f (+ a (* k h))))
    (define y-mult
      (cond ((or (= k 0) (= k n)) 1)
            ((even? k) 2)
            (else 4)))
    (* y-mult y))
  (define (finalize sum-res)
    (* h (/ sum-res 3)))
  (finalize (sum term 0 inc n)))


(display (integral cube 0 1 0.01)) ; ~0.25
(newline)
(display (integral-simpson cube 0 1 10)) ; ~0.25
(newline)

