(define (square n) (* n n))
(define (even? n)
  (= 0 (remainder n 2)))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(display (fast-expt 2 10))

