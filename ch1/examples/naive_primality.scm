(define (square x) (* x x))

(define (divides? a b) (= (remainder b a) 0))

(define (smallest-divisor n)
  (define (find-divisor test-divisor) 
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor (+ test-divisor 1)))))
  (find-divisor 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(display (prime? 11))
(newline)
(display (prime? 9))

