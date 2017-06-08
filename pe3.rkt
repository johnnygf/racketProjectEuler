#lang racket

(define (isFactor? number divisor)
  (cond 
    [(equal? (remainder number divisor) 0) #t]
    [else #f]))

(define (isPrime? number)
  (cond
    [(<= number 1) #f]
    [(< number 3) #t]
    [(isFactor? number 2) #f]
    [(isFactor? number 3) #f]
    [(lambda (i n)
      (cond
        [(<= (* i i) n) (or (isFactor? n i) (isFactor? n (+ i 2))) #f]) 
      5 number)]
    [else #t]))

(define (isPrimeFactor? number testFactor)
  (cond
    [(equal? testFactor 0) #f]
    [(equal? testFactor 1) #f]
    [(equal? testFactor 2) #t]
    [else #f]))

(define (testSuitePrimes start end)
  (cond
    [(isPrime? start) (printf "~a isPrime?~n" start)])
  (cond
    [(and (< start end)) (testSuitePrimes (+ 1 start) end)]))

(displayln "Run tests...")
(testSuitePrimes 1 229)


; (printf "0 isPrime? ~a ~n" (isPrime? 0))
; (printf "1 isPrime? (isPrime? 1)~n")
; (isPrime? 1)
; (isPrime? 2)
; (isPrime? 3)
; (isPrime? 4)
; (isPrime? 5)
; (isPrime? 6)
; (isPrime? 7)
; (isPrime? 8)
; (isPrime? 9)
; (isPrime? 10)
; (isPrime? 11)
; (isPrime? 12)
; (isPrime? 13)
; (isPrime? 14)
; (isPrime? 15)
; (isPrime? 16)
; (isPrime? 17)
; (isPrime? 18)
; (isPrime? 19)
; (isPrime? 20)
