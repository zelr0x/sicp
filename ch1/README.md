# Chapter 1

## Exercises

### 1.5
```scheme
(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))
```
Applicative order: call to procedure `test` never terminates because with applicative order, parameter `y` is evaluated even if condition `(= x 0` is true and the actual parameter is the call to procedure `p`, which is defined as an infinite recursion. 
Without TCO, calling `p` will overflow a stack (or result in an out of memory if the stack is growable).

Normal order: result is `0` because `x` is `0` and there is no attempt to evaluate `y` since `if` is a special form with short-circuit behavior.

### 1.6
```scheme
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))
```
`new-if` is a normal procedure. Normal procedures in Scheme use applicative order of evaluation, so `new-if` will try to evaluate its second parameter independent of the outcome of the conditional test. This leads to an infinite loop that will probably overflow a stack even with TCO.

### 1.9
First procedure generates a recursive process. 
Outer ifs in the substitution model are omitted for brevity:
```scheme
(define (+ a b)
  (if (= a 0) b (inc (+ (dec a) b))))
(+ 4 5)
;; (if (= 4 0) 5 (inc (+ 3 5)))
;; (inc (if (= 3 0) 5 (inc (+ 2 5))))
;; (inc (inc (if (= 2 0) 5 (inc (+ 1 5)))))
;; (inc (inc (inc (if (= 1 0) 5 (inc (+ 0 5))))))
;; (inc (inc (inc (inc 5))))
;; 9
```

Second procedure generates an iterative process.
```scheme
(define (+ a b)
  (if (= a 0) b (+ (dec a) (inc b))))
(+ 4 5)
;; (if (= 4 0) 5 (+ 3 6))
;; (if (= 3 0) 6 (+ 2 7))
;; (if (= 2 0) 7 (+ 1 8))
;; (if (= 1 0) 8 (+ 0 9))
;; 9
```

# 1.10
```scheme
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

(A 1 10)
;; (A 0 (A 1 9))
;; (A 0 (A 0 (A 1 8)))
;; (A 0 (A 0 (A 0 (A 1 7))))
;; (A 0 (A 0 (A 0 (A 0 (A 1 6)))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 32)))))
;; (A 0 (A 0 (A 0 (A 0 64))))
;; (A 0 (A 0 (A 0 128)))
;; (A 0 (A 0 256))
;; (A 0 512)
;; 1024

(A 2 4)
;; (A 1 (A 2 3))
;; (A 1 (A 1 (A 2 2)))
;; (A 1 (A 1 (A 1 (A 2 1))))
;; (A 1 (A 1 (A 1 2)))
;; (A 1 (A 1 (A 0 (A 1 1))))
;; (A 1 (A 1 (A 0 2)))
;; (A 1 (A 1 4))
;; (A 1 (A 0 (A 1 3)))
;; (A 1 (A 0 (A 0 (A 1 2))))
;; (A 1 (A 0 (A 0 (A 0 (A 1 1)))))
;; (A 1 (A 0 (A 0 (A 0 2))))
;; (A 1 (A 0 (A 0 4)))
;; (A 1 (A 0 8))
;; (A 1 16)
;; (A 0 (A 1 15))
;; (A 0 (A 0 (A 1 14)))
;; ...
```

```scheme
(define (f n) (A 0 n))  ;; 2n
(define (g n) (A 1 n))  ;; 2^n
(define (h n) (A 2 n))  ;; 2^2^2^2... | number of exponentiations is n
```

