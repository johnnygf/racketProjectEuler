; A palindromic number reads the same both ways. 
; The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

; Find the largest palindrome made from the product of two 3-digit numbers.


; proposed solution
; let a1 = b1 = 999
; let p1 = a1 * b1
; check if p1 is palindromic

; if p1 is not palindromic
; let a2 = a1 -1
; if a2 > a1 / 2
; let p2 = a2 * b1 etc

; if ax <= a1 /2
; let b2 = b1 - 1
; let px = ax * b2 etc