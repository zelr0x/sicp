(let ((x 2))
  (let ((x 3)
        (y (+ x 2)))
    (* x y)))
;; -> 12 instead of 15, since when y is evaluatedm x is still 2. In Clojure, the result would be 15.

