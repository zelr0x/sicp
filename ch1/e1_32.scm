(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (accumulate-recursive combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (id x) x)
(define (inc x) (+ 1 x))
(define (double x) (+ x 2))

(define (product term a next b)
  (accumulate * 1 term a next b))

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

