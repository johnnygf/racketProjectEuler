#lang racket

(define (isFactor? number divisor)
  (cond 
    [(equal? (remainder number divisor) 0) #t]
    [else #f]))

(define (isPrime? number)
  (cond
    [(equal? number 0) #f]
    [(equal? number 1) #f]
    [(equal? number 2) #t]
    [(equal? number 3) #t]
    [(equal? number 5) #t]
    [(isFactor? number 2) #f]
    [(isFactor? number 3) #f]
    [(isFactor? number 5) #f]
    [else #t]))

(define (isPrimeFactor? number testFactor)
  (cond
    [(equal? testFactor 0) #f]
    [(equal? testFactor 1) #f]
    [(equal? testFactor 2) #t]
    [else #f]))

(isPrime? 0)
(isPrime? 1)
(isPrime? 2)
(isPrime? 3)
(isPrime? 4)
(isPrime? 5)
(isPrime? 6)
(isPrime? 7)
(isPrime? 8)
(isPrime? 9)
(isPrime? 10)
(isPrime? 11)
(isPrime? 12)
(isPrime? 13)
(isPrime? 14)
(isPrime? 15)
(isPrime? 16)
(isPrime? 17)
(isPrime? 18)
(isPrime? 19)
(isPrime? 20)
