#lang racket #| Conditionals. |#

#| Prerequisites.
 Write a Python if-elif-else statement with at least three branches, then
  re-write it using only nested if-else. Notice that very little changes,
  except the indentation. |#

#| The Operation You'll Implement.
 A `cases` operation for case definitions as in CS/Math.
 Its components are: clauses of paired up condition and result expressions, and
  a default clause with just a result expression.
 Its evaluation is: evaluate the condition expressions in order until the first
  one that's true, then evaluate the corresponding result expression for the
  result value of the whole expression. If none of the conditions were true then
  the default result expression is evaluated for the result value of the whole
  expression. |#
(provide cases)

(define-syntax cases
  (syntax-rules (when otherwise)

  [(cases [«expression» when «condition»] [«expression»1 otherwise]) (if «condition» «expression» «expression»1 )]
    
  [(cases [«expression» when «condition»] [«expression»1 when «condition»1] ... [«expression»2 otherwise] ) 
   (if «condition» «expression» (cases [«expression»1 when «condition»1] ... [«expression»2 otherwise]))]))
  


#| Implementation.
 The concrete syntax looks more like a common case definition, as follows:
   A condition-result clause is a group of:
     1. Result expression.
     2. Keyword `when`.
     3. Condition expression.
   The default clause is a group of:
     1. Result expression.
     2. Keyword `otherwise`.
 Assume it's used with at least one non-default clause.
 Assume the condition expressions evaluate to booleans.
 Use only:
   • Our core forms.
   • From racket's library functions: only integer arithmetic functions.
   • The extended `define` (already part of racket's `define`).
   • Code transformation via `define-syntax-rule` or `define-syntax` with
      `syntax-rules`, if necessary. |#


(module+ test
  (define r (random 3))
  (cases ["zero" when (zero? r)]
         ["one" when (= r 1)]
         ["two" otherwise]))

(module+ test)

