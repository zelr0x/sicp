(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))
(define (cdr z)
  (z (lambda (p q) q)))

;; (car (cons 5 10))
;; (car (lambda (m) (m 5 10)))
;; ((lambda (m) (m 5 10)) (lambda (p q) p))
;; 5
(display ((lambda (m) (m 5 10)) (lambda (p q) p)))
(newline)
(display (car (cons 5 10)))
(newline)
(display (cdr (cons 5 10)))

