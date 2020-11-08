(define (id x) x)
(define zero (lambda (f) id))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; (add-1 zero)
;; (lambda (f) (lambda (x) (f ((zero f) x))))
;; (lambda (f) (lambda (x) (f (((lambda (f) id) f) x))))
;; (lambda (f) (lambda (x) (f (id x))))
;; (lambda (f) (lambda (x) (f x)))

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

;; Haven't figured it out yet.
;; Taken from http://community.schemewiki.org/?sicp-ex-2.6
(define (+ a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))

