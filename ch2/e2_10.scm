(define (make-interval x y) (cons x y))
(define (lower-bound z) (car z))
(define (upper-bound z) (cdr z))

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

(define (width z)
  (abs (/ (- (upper-bound z) (lower-bound z)) 2)))

(define a (make-interval 2 8))
(define b (make-interval -1 1))
(display (div-interval b a))
(newline)
(display (div-interval a b))
(newline)
