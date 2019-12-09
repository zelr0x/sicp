# SICP

## Applicative order versus normal order
https://mitpress.mit.edu/sites/default/files/sicp/full-text/book/book-Z-H-4.html#%_toc_%_sec_Temp_22

_*Normal-order evaluation*_ - an evaluation model where the operands will not be evaluated until their values were needed. Instead  operand expressions for parameters are substituted until an expression involving only primitive operators is obtained (fully expand and then reduce)

_*Applicative-order evaluation*_ - an evaluation model where the operands are evaluated first. Used by MIT Scheme interpreter. More efficient because it avoids multiple evaluation of the same operation.

For procedure applications that can be modeled using substitution and that yield legitimate values, normal-order and applicative-order evaluation produce the same value.
