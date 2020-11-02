(define (inc x) (+ x 1))

(define (cont-frac n d k)
  (define (iter acc i)
    (if (= i k)
        acc
        (iter (/ (n i) 
                 (+ acc (d i)))
              (inc i))))
  (iter 0.0 0))

(define (cont-frac-rec n d k)
  (define (iter i)
    (if (> i k)
      0
      (/ (n i) 
         (+ (d i) 
            (iter (inc i))))))
  (iter 1))

(display (cont-frac
           (lambda (i) 1.0) 
           (lambda (i) 1.0) 
           11))

