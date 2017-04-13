#lang racket
(define (fibonacci prev current valueLimit sumEvens)
  (define nextTerm (+ prev current))
  (displayln (string-append (number->string prev) " " (number->string current) " " (number->string nextTerm) " " (number->string sumEvens)))
  (cond
    [(< valueLimit prev) nextTerm]
    [(even? current) (fibonacci current nextTerm valueLimit (+ sumEvens current))]
    [else (fibonacci current nextTerm valueLimit sumEvens)]))

(fibonacci 1 2 4000000 0)