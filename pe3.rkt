#lang racket

(define (isPrimeFactor number)
  (cond
    [(equal? number 0) #f]
    [(equal? number 1) #f]
    [(equal? number 2) #t]
    [else #f]))

(isPrimeFactor 0)
(isPrimeFactor 1)
(isPrimeFactor 2)