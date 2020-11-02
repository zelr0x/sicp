(define (inc x) (+ x 1))

(define (cont-frac n d k)
  (define (iter acc i)
    (if (= i k)
        acc
        (iter (/ (n i) 
                 (+ acc (d i)))
              (inc i))))
  (iter 0.0 0))

(define (euler-frac-expansion k)
  (define (d i)
    (if (= (remainder i 3) 2.0)
        (/ (inc i) 1.5)
        1))
  (+ 2.0 (cont-frac (lambda (i) 1.0) d k)))


(display (euler-frac-expansion 10))

