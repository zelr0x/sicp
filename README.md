# SICP

## Running code
### Racket
Example scheme program at `./test.scm`:
```scheme
(define (square x)
  (* x x))

(display (square 5))
```
Run it:
```bash
racket -I r5rs --script ./test.scm
# -> 25
```
#### REPL
```bash
racket -iI r5rs
```
#### Running SICP-specific code
Some examples and exercises like the ones in chapter 2 can be ran with the help of the `sicp` package.
To install in in DrRacket go to `File > Install Package`, in the `package source` field type sicp.

To enable sicp language, add sicp-specific `lang` directive to the top of the file.
```scheme
#lang sicp
```
There can be only one such directive per file.

Use `require` to introduce some module, e.g. `sicp-pict`, to the working namespace:
```scheme
(#%require sicp-pict)
```

#### cmder alias
```bat
scheme=if [$1]==[] (racket -iI r5rs) else (racket -I r5rs --script $1 $*)
```

## Applicative order versus normal order
https://mitpress.mit.edu/sites/default/files/sicp/full-text/book/book-Z-H-4.html#%_toc_%_sec_Temp_22

_*Normal-order evaluation*_ (call by name, CBN) - an evaluation model where the operands are not be evaluated until their values are needed. Operand expressions for parameters are substituted until an expression involving only primitive operators is obtained (fully expand and then reduce).

_*Applicative-order evaluation*_ (call by value, CBV) - an evaluation model where the operands are evaluated first. Used by MIT Scheme interpreter. More efficient because it avoids multiple evaluation of the same operation.

For procedure applications that can be modeled using substitution and that yield legitimate values, normal-order and applicative-order evaluation produce the same value.

If an expression terminates in CBV evaluation, it also terminates in CBN evaluation. It is NOT true for the opposite direction: CBN termination doesn't imply CBV termination.


## `let` scope
```scheme
(let ((x 2))
  (let ((x 3)
        (y (+ x 2)))
    (* x y)))
;; => 12, because when y is evaluated, x is still 2.
```
In clojure, the result is 15:
```clojure
(let [x 2] 
  (let [x 3
        y (+ x 2)]
    (* x y)))
;; => 15, because [x 3] shadows [x 2] when y is evaluated.
```

## Terminology
*Recursive procedure* - a procedure that has the call to itself in its definition.

*Recursive process* - a process that might be produced by recursive procedure call. It involves creating a new stack frame for each recursive call.

*Iterative process* - a process that is produced by non-recursive procedure calls and that might also be produced by a recursive procedure call. It involves reusing the same stack frame for each recursive call.

*Tail call* - a recursive procedure call that does not involve any deferred computations i.e. a recursive call that appears as the only thing in the last expression of the procedure. For example, the expression `(* n (fact (- n 1)))` at the end of the definition of procedure `fact` is not a tail call, because it involves deferred multiplication by `n` besides a recursive call.

*TCO* - Tail call optimization, a technique used by compilers to allow tail calls to produce an iterative process instead of a recursive one.

