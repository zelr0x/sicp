(define (double n) (+ n n))
(define (halve n) (/ n 2))

(define (* b n)
  (define (iter b n acc)
    (cond ((= n 0) acc)
          ((even? n) (iter (double b) (halve n) acc))
          (else (iter b (- n 1) (+ b acc)))))
  (iter b n 0))

(display (* 17 13))  ;; 221 expected

