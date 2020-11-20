(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    '()
    (cons (accumulate op init (map car seqs))
          (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v)) m))

(define (transpose m)
  (accumulate-n cons '() m))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (matrix-*-vector cols row)) m)))

(define m (list '(1 2 3)
                '(4 5 6)
                '(7 8 9)))
(define v '(2 1 3))
(display (matrix-*-vector m v)) ;; (13 31 49)
(newline)
(display (transpose m))
(newline)
(display (matrix-*-matrix m m)) ;; ((30 36 42) (66 81 96) (102 126 150))

