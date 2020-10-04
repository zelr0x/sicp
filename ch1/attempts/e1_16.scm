;; Doesn't work with negative powers
;; (example doesn't work with them too)
(define (square n) (* n n))

(define (fast-expt b n)
  (define (iter a i)
    (cond ((= i n) a)
          ((not (< (/ n i) 2)) (iter (square a) (* i 2)))
          (else (iter (* a b) (+ i 1)))))
  (if (= n 0) 1 (iter b 1)))

(display (fast-expt 2 10))

