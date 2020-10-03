(define (pascal row col)
  (if (or (= col row) (= row 1) (= col 1))
        1
        (+ (pascal (- row 1) (- col 1))
           (pascal (- row 1) col))))

(display (pascal 5 4))

