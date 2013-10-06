#lang racket #| Immutable Structure/Record Datatypes. |#

#| Prerequisites.
 Review the `Box` type we created in lecture, and the `2ple` type from A0. |#

#| The Operations You'll Implement.
 Named immutable structure type creation, with named fields and accessors.
 The structure types will have one, two or three fields, depending on whether
  they're created with `structure¹` `structure²` or `structure³`.
 The components are: an identifier for the name of the type's constructor,
  and one, two, or three identifiers for the names of the type's fields.
 The evaluation is:
   1. Define the type name as a function to construct instances of the type,
       with arity equal to the number of field names.
   2. Define the field names as unary accessor functions taking an instance
       and returning that instance's field's value. |#
(provide stucture¹ structure² structure³)

#| Implementation.
 Use racket's `begin` to group the definitions produced into a single form
  (similarly to the way `sequenced` is used). It splices multiple definitions
  into the enclosing scope.
 Use only:
   • Our core forms, and `cases`.
   • The extended `define` (already part of racket's `define`).
   • From racket's library functions: only integer arithmetic functions.
   • These new operations, i.e. you might implement some in terms of the others.
   • Code transformation via `define-syntax-rule` or `define-syntax` with
      `syntax-rules`, where necessary. |#
#;(require "A1.Conditional.rkt")


(module+ test
  (structure³ Point (x y z))
  (define p (Point 207 209 324))
  (map (λ (field) (field p))
       (list x y z)))



