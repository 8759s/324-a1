#lang racket #| Sequencing. |#

#| Prerequisites.
 1. Review from CSC1X8/207 that in a Python/Java sequence of statements, all
     except perhaps the last statement are intended to be evaluated for their
     potential side-effects, since their values are unused.
 2. Identify components in our core forms that must be single expressions. |#

#| The Operation You'll Implement.
 A `sequenced` operation for sequencing expressions anywhere an expression is
  allowed.
 Its components are: one or more expressions.
 Its evaluation is: evaluate the expressions in order, the result value is
  the result value of the last expression. |#
(provide sequenced)

#| Implementation.
 Use only:
   • Our core forms, but don't call any racket library functions.
   • Code transformation via `define-syntax-rule`, where necessary.

 Hint: one of our core forms has as a component a sequence of expessions
  for later evaluation. |#

(define-syntax-rule (sequenced «expression»a ... )
  ((λ () «expression»a ... ) ))



(module+ test
  (sequenced #f #t)
  )