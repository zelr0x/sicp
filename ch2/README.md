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
