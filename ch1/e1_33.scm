(#%require (only racket/base random))

(define (id x) x)
(define (inc x) (+ 1 x))
(define (dec x) (- x 1))
(define (square x) (* x x))
(define (double x) (+ x 2))
(define (divides? a b) (= (remainder b a) 0))

(define (smallest-divisor n)
  (define (find-divisor test-divisor) 
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor (+ test-divisor 1)))))
  (find-divisor 2))
(define (prime? n)
  (if (= n 1) 
    #f
    (= n (smallest-divisor n))))

;; begin

(define (accumulate filter combiner null-value term a next b)
  (define (iter a result)
    (define (combine)
      (if (filter a)
        (combiner (term a) result)
        result))
    (if (> a b)
      result
      (iter (next a) (combine))))
  (iter a null-value))

(define (sum filter term a next b)
  (accumulate filter + 0 term a next b))

(define (product filter term a next b)
  (accumulate filter * 1 term a next b))

;; a
(define (prime-sq-sum a b)
  (sum prime? square a inc b))

;; b
(define (positive-lt-n-relatively-prime-to-n-product n)
  (define (relatively-prime? x)
    (= (gcd x n) 1))
  (product relatively-prime? id 1 inc n))

(display (prime-sq-sum 1 7)) ;; 87
(newline)
(display (positive-lt-n-relatively-prime-to-n-product 10)) ;; 189
(newline)

