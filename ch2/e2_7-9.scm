;; 2.7
(define (make-interval x y) (cons x y))
(define (lower-bound z) (car z))
(define (upper-bound z) (cdr z))

;; Example
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

;; 2.8
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
  (mul-interval
    x
    (make-interval (/ 1.0 (upper-bound y))
                   (/ 1.0 (lower-bound y)))))

;; 2.9
(define (width z)
  (abs (/ (- (upper-bound z) (lower-bound z)) 2)))

(define a (make-interval 2 8))
(define b (make-interval -6 10))
(display (width (sub-interval a b)))
(newline)
(display (abs (- (width a) (width b))))
(newline)
(display (width (add-interval a b)))
(newline)
(display (abs (+ (width a) (width b))))
(newline)
(display (width (mul-interval a b)))
(newline)
(display (abs (* (width a) (width b))))
(newline)
(display (width (div-interval a b)))
(newline)
(display (abs (/ (width a) (width b))))
(newline)
