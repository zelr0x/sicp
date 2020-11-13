(define (for-each action coll)
  (map (lambda (x) (let ((_ (action x))) #t)) coll))

(for-each (lambda (x)
            (newline)
            (display x))
          (list 57 321 88))

