(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (car (cdr mobile)))
(define (branch-length branch) (car branch))
(define (branch-structure branch) (car (cdr branch)))

;(define (make-mobile left right) (cons left right))
;(define (make-branch length structure)
;  (cons length structure))

(define (total-weight mobile)
  (cond ((null? mobile) 0)
        ((not (pair? mobile)) mobile)
        (else (+ (total-weight (branch-structure (left-branch mobile)))
                 (total-weight (branch-structure (right-branch mobile)))))))

(define (balanced? mobile)
  (define (torque branch)
    (* (total-weight (branch-structure branch))
       (branch-length branch)))
  (if (not (pair? mobile))
      #t
      (let ((left (left-branch mobile))
            (right (right-branch mobile)))
        (and (= (torque left) (torque right))
             (balanced? (branch-structure left))
             (balanced? (branch-structure right))))))

;; Test cases from http://community.schemewiki.org/?sicp-ex-2.29
(define a (make-mobile (make-branch 2 3) (make-branch 2 3))) 
(define d (make-mobile (make-branch 10 a) (make-branch 12 5))) 
(display (total-weight a)) ;; 6
(newline)
(display (balanced? d)) ;; #t

