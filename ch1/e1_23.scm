(define (square x) (* x x))
(define (divides? a b) (= (remainder b a) 0))

(define (smallest-divisor n)
  (define (find-divisor test-divisor) 
    (define (next)
      (if (= test-divisor 2) 
          3 
          (+ test-divisor 2)))
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor (next)))))
  (find-divisor 2))

(display (smallest-divisor 10))
(newline)
(display (smallest-divisor 15))
(newline)
(display (smallest-divisor 23))

