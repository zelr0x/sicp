(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(define (f-iter n)
  (define (iter a b c cnt)
    (if (= cnt 0)
        a
        (iter b
              c
              (+ c (* 2 b) (* 3 a))
              (- cnt 1))))
  (iter 0 1 2 n))

(display (f 10))
(newline)
(display (f-iter 10))

