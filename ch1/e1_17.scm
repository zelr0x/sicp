(define (double n) (+ n n))
(define (halve n) (/ n 2))

(define (* a b)
  (cond ((< b 0) a)
        ((= b 0) 0)
        ((not (< b 2)) (* (double a) (halve b)))
        (else (* (+ a a) (- b 1)))))

(display (* 5 10))

