;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Untitled) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define start 0)
(define end 1000)

(define (isFirstMultipleOfSecond number divisor)
  (cond
    [(zero? (remainder number divisor)) #true]
    [else #false]))

(define (sumMultiplesOf divisor start end)
  (cond
    [(equal? start end) 0]
    [(equal? #f (isFirstMultipleOfSecond start divisor)) (sumMultiplesOf divisor (+ 1 start) end)]
    [(equal? #t (isFirstMultipleOfSecond start divisor)) (+ start (sumMultiplesOf divisor (+ 1 start) end))]))

(+ (sumMultiplesOf 3 start end) (sumMultiplesOf 5 start end))