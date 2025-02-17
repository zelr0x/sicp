(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

(define (test-all n)
  (define (try-it a)
    (= (expmod a n n) a))
  (define (iter i)
    (cond ((= i 0) #t)
          ((try-it i) (iter (- i 1)))
          (else #f)))
  (iter (- n 1)))

(display (test-all 561))
(newline)
(display (test-all 1105))
(newline)
(display (test-all 1729))
(newline)
(display (test-all 2465))
(newline)
(display (test-all 2821))
(newline)
(display (test-all 6601))
(newline)

