(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  iter)

(define (iterative-improve-comparing-next good-enough? improve)
  (define (iter guess)
    (let ((next (improve guess)))
      (if (good-enough? guess next)
          guess
          (iter next))))
  iter)

(define (average x y) (/ (+ x y) 2))
(define (square x) (* x x))
(define (abs x)
  (if (< x 0)
      (- x)
      x))
(define (sqrt x)
  ((iterative-improve
    (lambda (guess) (< (abs (- x (square guess))) 0.0001))
    (lambda (guess) (average guess (/ x guess))))
   1.0))

(define (fixed-point f first-guess)
  ((iterative-improve-comparing-next 
    (lambda (v1 v2) (< (abs (- v1 v2)) 0.00001))
    f)
   first-guess))

(display (sqrt 25))
(newline)
(display (fixed-point cos 1.0)) ; 0.73908
(newline)
(display (fixed-point (lambda (y) (+ (sin y) (cos y)))
                      1.0)) ; 1.25873
(newline)

