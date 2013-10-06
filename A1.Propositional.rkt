#lang racket #| Mastering the Propositional Operations. |#

#| Prerequisites.
 1. Recall/review the behaviour of "and" "or" "not" from CSC1X8/207 Python/Java.
    In particular: which ones short-circuit, and which are eager by-value.
 2. Review the discussion of them from the first two lectures.
    In particular: do the exercise about replacing them by functions, in Python
     or any familiar language.
    In particular: trace our core language "and" function experiments, and use
     the Macro-Stepper on a use of the syntactic form implementation of "and".
 3. Contact us if that doesn't result in mastery of that material. |#

#| The Operations You'll Implement.
 Their names are in the `provide` below.
 A `provide` makes them available (exports them) from this module, similar to
  "public" in some languages (review CSC207 Java).
 The meaning of "neither" and implication are as in English and Math/CS, but
  you can double-check your interpretation against the example usage below. |#
(provide ∧ ∨ ¬ neither ⇒)

#| Implementation.
 Decide for each one whether it has natural short-circuiting behavior.
 If it doesn't then make it as a function, otherwise as a new syntactic form.
 Use only:
   • Our core forms, but don't call any racket library functions.
   • The extended `define` (already part of racket's `define`).
   • These new forms, i.e. you might implement some in terms of the others.
   • Code transformation via `define-syntax-rule`, where necessary.
 Put all syntactic form definitions before all function definitions. |#

#| One implemented for you. |#
(define-syntax-rule (¬ «expression»)
  (if «expression» #f #t))

(define-syntax-rule (∧ «expression»₀ «expression»₁)
  (if (¬ «expression»₀) #f «expression»₁))

(define-syntax-rule (∨ «expression»₀ «expression»₁)
  (if «expression»₀ #t «expression»₁))



(define-syntax-rule (neither «expression»₀ «expression»₁)
  (if «expression»₀ #f (¬ «expression»₁)))

(define-syntax-rule (⇒ «expression»₀ «expression»₁)
  (if (¬ «expression»₀) #t (if (¬ «expression»₁) #f #t)))

; Uncomment to have this submodule run when running this file in DrRacket.
(module+ test
  (define ≤ <=)
  (define (non-decreasing? ℓ)
    ; Declarative programming style/paradigm.
    (⇒ (neither (empty? ℓ) (empty? (rest ℓ)))
       (∧ (≤ (first ℓ) (second ℓ))
          (non-decreasing? (rest ℓ)))))
  (non-decreasing? (list 108 148 207 324))
  (non-decreasing? (list 308 165 148 207)))

; Put your testing in here.
(module+ test)