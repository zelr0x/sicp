(define (first-denom kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))
(define (count-change amount)
  (define (cc a kinds-of-coins)
    (cond ((= a 0) 1)
          ((or (< a 0) (= kinds-of-coins 0)) 0)
          (else (+ (cc a (- kinds-of-coins 1))
                   (cc (- a (first-denom kinds-of-coins))
                       kinds-of-coins)))))
  (cc amount 5))

(display (count-change 100))  ;; 292 expected

