(define (make-interval x y) (cons x y))
(define (lower-bound z) (car z))
(define (upper-bound z) (cdr z))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c tolerance)
  (make-interval (- c (percent c tolerance))
                 (+ c (percent c tolerance))))
(define (percent x percents)
  ;; Produces the percentage tolerance for a given interval center.
  ;; Assumes tolerance is an integer, e.g. 5% is 5 and not 0.05
  (* x (/ percents 100)))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (define (log-div-err) 
    ;; FIXME: figure out why error procedure doesn't work here
    "Division by interval spanning 0.")
  (let ((y-lo (lower-bound y))
        (y-up (upper-bound y)))
    (if (<= (* y-lo y-up) 0)
      (log-div-err)
      (mul-interval
        x
        (make-interval (/ 1.0 y-up) (/ 1.0 y-lo))))))

(define a (make-center-percent 6.8 10))
(display a) ;; ~ [6.12, 7.48]
(newline)
