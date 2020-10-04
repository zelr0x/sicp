(define (double n) (+ n n))
(define (halve n) (/ n 2))

(define (* a b)
  (define (iter a b acc)
    (cond ((= b 0) acc)
          ((even? b) (iter (double a) (halve b) acc))
          (else (iter a (- b 1) (+ acc a)))))
  (iter a b 0))

(display (* 5 10))

