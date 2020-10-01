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

