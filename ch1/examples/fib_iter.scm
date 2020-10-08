(define (fib n)
  (define (iter a b count)
    (if (= count 0)
      b
      (iter (+ a b) a (- count 1))))
  (iter 1 0 n))

(display (fib 10)) ;; 55 expected

