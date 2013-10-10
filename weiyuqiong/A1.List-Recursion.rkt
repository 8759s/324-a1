#lang racket #| Immutable Lists. |#

#| Prerequisites.
 1. Review Linked Lists from CSC148.
    In particular: list as head node, versus wrapper class to preserve identity
     during change in state.
 2. Review Recursion from CSC148.
 3. Review Recursive Definitions from CSC236.
 4. Week 4 Tutorial, if you're not solid on recursion. |#

#| Discussion.
 Immutable linked lists are simpler than mutable ones, since there's:
    No RE-linking.
    Empty lists are never MUTATED into non-empty ones, and vice-versa, so
     empty's lack of links (if e.g. using None/null in Python/Java) is not
     not a problem.
 So unlike the wrapper approach, there's no need to distinguish between nodes
  and lists, except for having a special empty list that isn't a node. A node
  is a list by having the first/front/head element and the rest/tail of the
  list (via a reference to the next node, which is also considered a list). |#

#| Implementation.
 You treat "list"s in this file as an Abstract Data Type.
 Formally, a list is either
   0. Empty.
   1. A first element value, and the rest-of-the-list list.

 You should study the implementation eventually, it's content we've covered.
 But it's here in a sub-module to emphasize the familiar ADT. Uses lists here
  only via the functions and empty list value `provide`d in this sub-module.
  In particular don't use them directly as closures (i.e. don't call lists). |#
(module List racket ; Submodule named List implemented in its own #lang racket.
  (provide empty-list
           with-first-element
           empty-list?
           first-element-of
           rest-of)
  #| Constructors. |#
  ; The empty list.
  ;  The `gensym` function creates a new unique value equal only to itself.
  (define empty-list (gensym))
  ; For value `e` and list `r`: (with-first-element e r) is a (new) list with
  ;  `e` as its first element and `r` as the rest of the list.
  (define ((with-first-element e r) which) (if which e r))
  #;
  (define with-first-element (λ (e r)
                               (λ (which)
                                 (if which e r))))
  
  #| Predicates. |#
  ; Whether `ℓ` is the empty list.
  (define (empty-list? ℓ) (equal? ℓ empty-list))
  
  #| Accessors. |#
  ; For non-empty list `ℓ`: the first element.
  (define (first-element-of ℓ) (ℓ #t))
  ; For non-empty list `ℓ`: the list without the first element.
  (define (rest-of ℓ) (ℓ #f)))
(require 'List) ; Imports the submodule's exported API.

#| Operations You'll Implement.
 `list₁` `list₂` and `list₃` are unary/binary/ternary taking values and
   returning a list containing those values.
 `string←list` takes a list of numbers and booleans and returns a string
  with with the human representations of the elements, separated by single
  spaces (and it may contain a trailing space if you find that easier).
 `build-list` takes a unary function and a natural number, returning a list
   with as many elements as the given natural number. The elements are the
   result of calling the given function on the numbers 0, 1, ... up to but
   not including the given natural number. |#
(provide list₁ list₂ list₃
         string←list
         build-list)

(define-syntax-rule (list₁ «expression»1) (with-first-element «expression»1 empty-list) )

(define-syntax-rule (list₂ «expression»1 «expression»2) 
  (with-first-element «expression»1 (list₁ «expression»2)))

(define-syntax-rule (list₃ «expression»1 «expression»2 «expression»3) 
  (with-first-element «expression»1 (list₂ «expression»2 «expression»3)))


(require "A1.Conditional.rkt")


(define string←list    
  (λ (List)
    (if (empty-list? List) ""
        (string-append
         (string-append
          (cases [(number->string (first-element-of List)) when (number? (first-element-of List))]      
           ["True" when (first-element-of List)]
           ["False" otherwise]) " ")
         (string←list (rest-of List))))))


(define build-list
  (λ («function»  «number»)
    (define helper
      (λ (i)
        (if (< i «number»)
            (with-first-element («function» i) (helper (+ i 1)))
            empty-list)))
        (helper 0)))

#| Implementation.
 Use only:
   • Our core forms, and `cases`. 
   • The extended `define` (already part of racket's `define`).
   • From racket's library functions: only integer arithmetic functions,
      `number->string`, and `string-append`.
   • These new operations, i.e. you might implement some in terms of the others.
   • The already implemented functions.
   • Code transformation via `define-syntax-rule` or `define-syntax` with
      `syntax-rules`, where necessary. |#

(module+ test
  ; Displays: 148 true 324
  
  (displayln (string←list (list₃ 148 #t 324))))
(displayln (string←list(build-list sqr 5)))

