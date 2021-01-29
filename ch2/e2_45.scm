#lang sicp

(#%require sicp-pict)

;; Solution
(define (split base step)
  (define (f painter n)
    (if (= n 0)
        painter
        (let ((smaller (f painter (- n 1))))
          (base painter (step smaller smaller)))))
  f)

(define (up-split-old painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split-old painter (- n 1))))
        (below painter (beside smaller smaller)))))

(define (right-split-old painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split-old painter (- n 1))))
        (beside painter (below smaller smaller)))))

(paint (up-split-old einstein 4))
(paint (right-split-old einstein 4))
  
(define right-split (split beside below))
(define up-split (split below beside))
  
(paint (up-split einstein 4))
(paint (right-split einstein 4))

