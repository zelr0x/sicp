(define (even? n)
  (= (remainder n 2) 0))
(define (square n) (* n n))

(define (fast-expt b n)
  (define (iter b n a)
    (cond ((= n 0) a)
          (even? n)) (iter (square b) (/ n 2) a))
          (else (iter b (- n 1) (* b a))))

(display (fast-expt 2 10))

