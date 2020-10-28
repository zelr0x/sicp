(define (id x) x)
(define (inc x) (+ 1 x))
(define (double x) (+ x 2))

(define (product-recursive term a next b)
  (if (> a b)
    1
    (* (term a)
       (product term (next a) next b))))

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* (term a) result))))
  (iter a 1))

(define (factorial x)
  (product id 1 inc 5))

(define (pi n)
  (define (term x)
    (if (even? x)
      (/ (double x) (inc x))
      (/ (inc x) (double x))))
  (* 4 (product term 1.0 inc n)))

(display (factorial 5)) ; 120
(newline)

(display (pi 1000000)) ; 3.1415...
(newline)

