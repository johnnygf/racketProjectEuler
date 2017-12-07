#lang racket
; A palindromic number reads the same both ways. 
; The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

; Find the largest palindrome made from the product of two 3-digit numbers.


; proposed solution
; let a1 = b1 = 999
; let p1 = a1 * b1
; check if p1 is palindromic

; if p1 is not palindromic
; let a2 = a1 - 1
; if a2 > a1 / 2
; let p2 = a2 * b1 etc

; if ax <= a1 / 2
; let b2 = b1 - 1
; let px = ax * b2 etc

; check palindromicity
; let p = wxyz
; p is palindromic if w == z and x == y
; get digits: 
; method 1) divide by 10, get remainder, put into a string, cut in two, compare first half with reversed second half
; method 2) e.g. let n 9889 divide by 10, let d1 = remainder = 9, 
;           let n2 = 988, let d2 = remainder(n2/10) = 8
;           let n3 = 98, let d3 = remainder(n3/10) = 8
;           let n4 = 9

(define (getMostSignificantDigit m)
    (cond
        [(< m 10) (modulo m 10)]
        [(getMostSignificantDigit (floor (/ m 10)))]
    )
)

(define (getLeastSignificantDigit l)
    (modulo l 10)
)

(define (removeMostSignificantDigit r) 
    (- r (* (expt 10 (- (getPlaceValueMostSignificantDigit r 0) 1)) (getMostSignificantDigit r)))
)

(define (removeLeastSignificantDigit r)
    (floor (/ r 10))
)

(define (getPlaceValueMostSignificantDigit p v)
    (cond
        [(< p 10) (+ v 1)]
        [(getPlaceValueMostSignificantDigit (/ p 10) (+ v 1))]
    )
)

(define (getNumberTraillingZeroes n m)
    (cond
        [(> (getLeastSignificantDigit n) 0) m]
        [(= (getLeastSignificantDigit n) 0) (getNumberTraillingZeroes (removeLeastSignificantDigit n) (+ m 1))]
    )
)

(define (removeTraillingZeroes t)
    (cond
        [(> (getLeastSignificantDigit t) 0) t]
        [(= (getLeastSignificantDigit t) 0) (removeTraillingZeroes (removeLeastSignificantDigit t))]
    )
)

(define (isPalindrome? p)
    (cond 
        [(<= p 10) #t]
        [(and (< p 1000) (= (getMostSignificantDigit p) (getLeastSignificantDigit p))) #t]
        [(and 
            (= (getMostSignificantDigit p) (getLeastSignificantDigit p))
            (= 
                (- 
                    (getPlaceValueMostSignificantDigit p 0) 
                    (getPlaceValueMostSignificantDigit (removeMostSignificantDigit p) 0)
                )
                (getNumberTraillingZeroes (removeMostSignificantDigit p) 0)
                )
            )
            (isPalindrome? (removeTraillingZeroes (removeMostSignificantDigit p)))]
        [else #f]
    )
)

(displayln "")
(printf " 9: isPalindrome? = ~a~n" (isPalindrome? 9))
(printf "10: isPalindrome? = ~a~n" (isPalindrome? 10))
(printf "11: isPalindrome? = ~a~n" (isPalindrome? 11))
(printf "12: isPalindrome? = ~a~n" (isPalindrome? 12))
(printf "13: isPalindrome? = ~a~n" (isPalindrome? 13))
(printf "22: isPalindrome? = ~a~n" (isPalindrome? 22))
(printf "303: isPalindrome? = ~a~n" (isPalindrome? 303))
(printf "989: isPalindrome? = ~a~n" (isPalindrome? 989))
(printf "19891: isPalindrome? = ~a~n" (isPalindrome? 19891))
(printf "1008001: isPalindrome? = ~a~n" (isPalindrome? 1008001))

(printf "  9: getMostSignificantDigit = ~a~n" (getMostSignificantDigit 9))
(printf " 10: getMostSignificantDigit = ~a~n" (getMostSignificantDigit 10))
(printf " 12: getMostSignificantDigit = ~a~n" (getMostSignificantDigit 12))
(printf "989: getMostSignificantDigit = ~a~n" (getMostSignificantDigit 989))
(printf "  1: getLeastSignificantDigit = ~a~n" (getLeastSignificantDigit 1))
(printf " 12: getLeastSignificantDigit = ~a~n" (getLeastSignificantDigit 12))
(printf "989: getLeastSignificantDigit = ~a~n" (getLeastSignificantDigit 989))

(printf "1: getPlaceValueMostSignificantDigit = ~a~n" (getPlaceValueMostSignificantDigit 1 0))
(printf "10: getPlaceValueMostSignificantDigit = ~a~n" (getPlaceValueMostSignificantDigit 10 0))
(printf "100: getPlaceValueMostSignificantDigit = ~a~n" (getPlaceValueMostSignificantDigit 100 0))

(printf "11: removeMostSignificantDigit = ~a~n" (removeMostSignificantDigit 11))
(printf "111: removeMostSignificantDigit = ~a~n" (removeMostSignificantDigit 111))

(printf "21: removeLeastSignificantDigit = ~a~n" (removeLeastSignificantDigit 21))
(printf "211: removeLeastSignificantDigit = ~a~n" (removeLeastSignificantDigit 211))

(printf "10: getNumberTraillingZeroes = ~a~n" (getNumberTraillingZeroes 10 0))
(printf "100: getNumberTraillingZeroes = ~a~n" (getNumberTraillingZeroes 100 0))
(printf "1000: getNumberTraillingZeroes = ~a~n" (getNumberTraillingZeroes 1000 0))

(printf "10: removeTraillingZeroes = ~a~n" (removeTraillingZeroes 10))
(printf "900: removeTraillingZeroes = ~a~n" (removeTraillingZeroes 900))
(printf "8000: removeTraillingZeroes = ~a~n" (removeTraillingZeroes 8000))
