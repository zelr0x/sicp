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

### 1.10
```scheme
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))
```
```scheme
(A 1 10)
(A 0 (A 1 9))
(A 0 (A 0 (A 1 8)))
(A 0 (A 0 (A 0 (A 1 7))))
(A 0 (A 0 (A 0 (A 0 (A 1 6)))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16))))))
(A 0 (A 0 (A 0 (A 0 (A 0 32)))))
(A 0 (A 0 (A 0 (A 0 64))))
(A 0 (A 0 (A 0 128)))
(A 0 (A 0 256))
(A 0 512)
;; 1024
```
```scheme
(A 2 4)
(A 1 (A 2 3))
(A 1 (A 1 (A 2 2)))
(A 1 (A 1 (A 1 (A 2 1))))
(A 1 (A 1 (A 1 2)))
(A 1 (A 1 (A 0 (A 1 1))))
(A 1 (A 1 (A 0 2)))
(A 1 (A 1 4))
(A 1 (A 0 (A 1 3)))
(A 1 (A 0 (A 0 (A 1 2))))
(A 1 (A 0 (A 0 (A 0 (A 1 1)))))
(A 1 (A 0 (A 0 (A 0 2))))
(A 1 (A 0 (A 0 4)))
(A 1 (A 0 8))
(A 1 16)
(A 0 (A 1 15))
(A 0 (A 0 (A 1 14)))
;; ... a lot of computations
;; 65536
```

```scheme
(define (f n) (A 0 n))
```
O(*2n*)
```scheme
(define (g n) (A 1 n))
```
O(*2ⁿ*)
```scheme
(define (h n) (A 2 n))
```
O(*2<sup>2ⁿ</sup>*)

### 1.14
a: amount
k: coin-kinds

Space: O(*a*)
Time: O(*a<sup>k</sup>*)

### 1.15
```scheme
(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))
```
a. How many times is p applied: 6 including initial invokation, 5 otherwise:
```
12.15
4.05
1.35
0.45
0.15
0.05
```

b. Growth as a function of a (angle):
Space: O(*a*)
Time: O(log₃ *a*)

### 1.20
```scheme
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(gcd 206 40)
```

#### Normal order
```scheme
(gcd 40 6)
(gcd 6 4)
(gcd 4 2)
2
```
There are three calls to `remainder` and all of them are successful.

#### Applicative order
```scheme
(gcd 40 6)
(gcd 6 4)
(gcd 4 2)
; remainder: undefined for 0
```
There are 4 calls to `remainder`: the first three are successful, but the last one requires division by zero.

### 1.21
```scheme
(smallest-divisor 199)    ; 199
(smallest-divisor 1999)   ; 1999
(smallest-divisor 19999)  ; 7
```

### 1.23
Added `if` expression likely introduced extra branching.
It makes the ratio of the speeds of two algorithms to be less than 2.

### 1.24
It is expected that for a number X, test will be twice as fast as for a number with twice as many digits.
However, modern machines don't allow testing it properly, since testing small numbers takes less than a millisecond.

r5rs `random` function doesn't work with numbers greater than `2^32 - 1`.
However, even if it did, it wouldn't be a clear test, since operations on 128-bit integers
are not as fast as operations on 32- or 64-bit integers (that is, on a generic x64 machine).

### 1.25
Procedure `fast-expt` involves recursively computing the square of a number. It results in a chain of deferred computations of `square` procedure, which can produce very large results, because the arguments passed to it are the results of `fast-expt`, i.e. exponentiated numbers:
```scheme
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))
```

Original version of `expmod` looks similar at first glance, but the difference is crucial. It also produces deferred computations of `square`, but it doesn't compute squares of such large numbers. The reason is, the arguments passed to `square` are the results of `expmod`, i.e. numbers modulo m:
```scheme
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))
```

Now, let's remember how `fermat-test` looks:
```scheme
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))
```
If we use the `fast-expt` version, the base argument of `fast-expt` will be the random number between 2 and `n` and the exponent will be `n`. With such arguments, the final result of `square` will exceed native word size of modern machines well before we even hit the first 3-digit `n`. Since operating  numbers exceeding native word size is relatively slow, the `fast-expt` version is slower than the original version.

### 1.26
Louis changed expression
```scheme
((even? exp)
 (remainder (square (expmod base (/ exp 2) m)) m))
```
to
```scheme
((even? exp)
 (remainder (* (expmod base (/ exp 2) m)
               (expmod base (/ exp 2) m))
            m))
```
The crucial difference here is that expression
```scheme
(expmod base (/ exp 2) m)
```
is evaluated twice in the Louis's version and only once in the normal version, because lisp interpreters usually use applicative order evaluation for procedure arguments.
