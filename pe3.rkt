#lang racket

(define (isFactor? number divisor)
  (cond 
    [(equal? (remainder number divisor) 0) #t]
    [else #f]))

(define (isPrime? number)
  (cond
    [(<= number 1) #f]
    [(<= number 3) #t]
    [(isFactor? number 2) #f]
    [(isFactor? number 3) #f]
    [else (isPrimeLoop number 5)]))

(define (isPrimeLoop number i)
  (cond
    [(> (* i i) number) #t]
    [else (cond
      [(or (isFactor? number i) (isFactor? number (+ i 2))) #f]
      [else (isPrimeLoop number (+ i 6))])]))

(define (largestPrimeFactor number)
  (cond
    [(isPrime? number) number]
    [else (largestPrimeFactorLoop number 2)]))

(define (largestPrimeFactorLoop number testNumber)
  (cond
    [(isFactor? number testNumber) (largestPrimeFactor (/ number testNumber))]
    [(isPrime? number) number]
    [else (largestPrimeFactorLoop number (+ testNumber 1))]))

(define (testSuitePrimes start end)
  (cond
    [(isPrime? start) (printf "~a isPrime?~n" start)])
  (cond
    [(and (< start end)) (testSuitePrimes (+ 1 start) end)]))

(displayln "")
(displayln "")
(printf "45: largetsPrimeFactor = ~a~n" (largestPrimeFactor 45))
(displayln "")
(printf "13195: largetsPrimeFactor = ~a~n" (largestPrimeFactor 13195))
(displayln "")
(printf "600851475143: largetsPrimeFactor = ~a~n" (largestPrimeFactor 600851475143))
