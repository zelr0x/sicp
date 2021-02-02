# Chapter 2

## Exercises

### 2.19

Order of the coins in the list doesn't affect the answer
because the list is fully processed, and the processing involves
only addition to and subtraction from the same variable `amount`.

### 2.21
Defining square-list this way produces the
answer list in the reverse order of the one desired:
```scheme
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

(display (square-list (list 1 2 3 4))) ;; 16 9 4 1
```
`cons` adds the specified object to the start of the list.

`answer` variable state evolution:
```
```scheme
()
(1)
(4 1)
(9 4 1)
(16 9 4 1)
```

With this procedure:
```scheme
(define (square-list items)
  (define (iter things answer)
    (display answer)
    (newline)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items '()))

(display (square-list (list 1 2 3 4)))
```

`answer` variable state evolution looks like this:
```scheme
(() . 1)
((() . 1) . 4)
(((() . 1) . 4) . 9)
((((() . 1) . 4) . 9) . 16)
```

### 2.24
```scheme
(list 1 (list 2 (list 3 4)))
;; (1 (2 (3 4)))
```
```
+-------+   +-------+
| ● | ● +---> ● | / |
+-+-----+   +-+-----+
  |           |
+-V-+       +-V-----+   +-------+
| 1 |       | ● | ● +---> ● | / |
+---+       +-+-----+   +-+-----+
              |           |
            +-V-+       +-V-----+   +-------+
            | 2 |       | ● | ● +---> ● | / |
            +---+       +-+-----+   +-+-----+
                          |           |
                        +-V-+       +-V-+
                        | 3 |       | 4 |
                        +---+       +---+
```
```
(1 (2 (3 4)))
     /\
    /  \
   1   (2 (3 4))
          /\
         /  \
        2   (3 4)
             /\
            /  \
           3    4
```

### 2.25
```scheme
(car (cdr (car (cdr (cdr '(1 3 (5 7) 9))))))
(car (car '((7))))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr '(1 (2 (3 (4 (5 (6 7))))))))))))))))))
```

### 2.26
```scheme
(define x (list 1 2 3))
(define y (list 4 5 6))

(append x y) ;; (1 2 3 4 5 6)
(cons x y)   ;; ((1 2 3) 4 5 6)
(list x y)   ;; ((1 2 3) (4 5 6))
```

### 2.32

Each subset of `s` is a first item of `s` consed with each subset of `cdr` of `s` and all that appended to a list containing
all the subsets of cdr of s.

If `s` is empty, returns empty list (representing an empty set).

If `s` contains one element, returns a set of that element and all subsets of its `cdr` i.e. an empty set.
This works because `(append '() '(5))` produces `(5)` and not `(5 '())`

If `s` contains two elements, returns a list of the first element added to each subset of its `cdr`, which is explained in the case above, appended to a list of all subsets of its `cdr`, including an empty set.
```scheme
(define (subsets s)
  (if (null? s)
    '(())
    (let ((rest (subsets (cdr s))))
      (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(display (subsets '(1 2 3))) ;; (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
```

### 2.38
```scheme
(define (fold-right op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(fold-right / 1 (list 1 2 3)) ;; = 1 / (2 / 3) = 3/2
(fold-left / 1 (list 1 2 3)) ;; = (1 / 2) / 3 = 1/6
(fold-right list nil (list 1 2 3)) ;; (1 (2 (3 ())))
(fold-left list nil (list 1 2 3)) ;; (((() 1) 2) 3)
```

A property that op should satisfy to guarantee that
fold-right and fold-left will produce the same values
for any sequence is __associativity__.

### 2.54
```scheme
(list 'a 'b 'c)  ;; {a b c}
(list (list 'george))  ;; {{george}}
(cdr '((x1 x2) (y1 y2)))  ;; {{y1 y2}}
(cadr '((x1 x2) (y1 y2)))  ;; {y1 y2}   (car '((y1 y2)))
(pair? (car '(a short list)))  ;; #f    (pair? 'a)
(memq 'red '((red shoes) (blue socks)))  ;; #f  (because memq is not tree-recursive)
(memq 'red '(red shoes blue socks))      ;; {red shoes blue socks}
```

