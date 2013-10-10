#lang racket #| Immutable Structure/Record Datatypes. |#

;(require "CSC324.2013F.Sep-20.tracer.rkt")

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
;(provide stucture¹ structure² structure³)

#;(define-syntax-rule(structure³ name (f1 f2 f3))
  (begin
    (define name
      (λ (f1 f2 f3) 
        (case [f1 when 1]
              [f2 when 2]
              [f3 otherwise])))
    (define f1 (λ (name) (name 1)))
    (define f2 (λ (name) (name 2)))
    (define f3 (λ (name) (name 3)))))


(define-syntax-rule(structure³ name (f1 f2 f3))
  (begin
    (define name
      (λ (f1 f2 f3)
        (λ (which1 which2)
          (if which1 f1 (if which2 f2 f3)))))
    (define f1 (λ (name) (name #t #t)))
    (define f2 (λ (name) (name #f #t)))
    (define f3 (λ (name) (name #f #f)))))

#;(define-syntax-rule(structure² name (f1 f2))
  (begin
    (define name
      (λ (f1 f2)
        (λ (which)
          (if which f1 f2))))
    (define f1 (λ (name) (name #t)))
    (define f2 (λ (name) (name #f)))
    ))

#;(define-syntax-rule(stucture¹ name (f1))
  (begin 
    (define name
      (λ (f1) (λ (which) (if which f1 ""))))
    (define f1 (λ (name) (name #t))))) 

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
(require "A1.Conditional.rkt")
(module+ test
  (structure³ Point (x y z))
  (define p (Point 207 209 324))
  (map (λ (field) (field p))
       (list x y z)))

#;(module+ test
  (structure² Point (x y))
  (define p (Point 209 324))
  (map (λ (field) (field p))
       (list x y)))
#;(module+ test
  (stucture¹ Point (x))
  (define p (Point 324))
  (map (λ (field) (field p))
       (list x)))





