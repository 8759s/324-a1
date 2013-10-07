#lang racket #| Variable Mutation. |#

#| Prerequisites.
 1. Review assignment and augmented assignment from CSC1X8/207 in Python/Java.
 2. Review our discussions of assignment operations versus functions. |#

#| The Operations You'll Implement.
 A general variable value transformation operation, and a prefix increment. |#
(provide set!! ++)

#| Implementation.
 Make `set!!` that takes an update expression where the second component of
  that expression is an identifier for a variable. It updates the value of the
  variable to the result of the expression.
 Decide whether Java prefix increment is a function or not, and implement it.

 Use only:
   • Our core forms.
   • From racket's library functions: only integer arithmetic functions.
   • The extended `define` (already part of racket's `define`).
   • These new forms, i.e. you might implement some in terms of the others.
   • Code transformation via `define-syntax-rule`, where necessary.
   • `sequenced` (by uncommenting the `require` below). |#
#;(require "A1.Sequencing.rkt")

(define-syntax-rule (set!! (oper id var ...))
 (set! id (oper id var ...)))

(define-syntax-rule (++ x)
  (+ x 1))

(module+ test
  (define x 108)
  (set!! (- x 90))
  (set!! (sqr x))
  (displayln x) #; 324
  (displayln (++ x)) #; 325
  (displayln x) #; 325)