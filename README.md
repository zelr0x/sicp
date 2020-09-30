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

## Applicative order versus normal order
https://mitpress.mit.edu/sites/default/files/sicp/full-text/book/book-Z-H-4.html#%_toc_%_sec_Temp_22

_*Normal-order evaluation*_ (call by name, CBN) - an evaluation model where the operands are not be evaluated until their values are needed. Operand expressions for parameters are substituted until an expression involving only primitive operators is obtained (fully expand and then reduce).

_*Applicative-order evaluation*_ (call by value, CBV) - an evaluation model where the operands are evaluated first. Used by MIT Scheme interpreter. More efficient because it avoids multiple evaluation of the same operation.

For procedure applications that can be modeled using substitution and that yield legitimate values, normal-order and applicative-order evaluation produce the same value.

If an expression terminates in CBV evaluation, it also terminates in CBN evaluation. It is NOT true for the opposite direction: CBN termination doesn't imply CBV termination.


## Terminology
*Recursive procedure* - a procedure that has the call to itself in its definition.

*Recursive process* - a process that might be produced by recursive procedure call. It involves creating a new stack frame for each recursive call.

*Iterative process* - a process that is produced by non-recursive procedure calls and that might also be produced by a recursive procedure call. It involves reusing the same stack frame for each recursive call.

*Tail call* - a recursive procedure call that does not involve any deferred computations i.e. a recursive call that appears as the only thing in the last expression of the procedure. For example, the expression `(* n (fact (- n 1)))` at the end of the definition of procedure `fact` is not a tail call, because it involves deferred multiplication by `n` besides a recursive call.

*TCO* - Tail call optimization, a technique used by compilers to allow tail calls to produce an iterative process instead of a recursive one.

