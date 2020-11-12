(define (count-change amount coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (null? coins)) 0)
        (else (+ (count-change amount (cdr coins))
                 (count-change (- amount (car coins)) coins)))))

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))
(display (count-change 100 us-coins))  ;; 292 expected

