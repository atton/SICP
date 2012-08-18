;(runtime)については http://d.hatena.ne.jp/awacio/20100221/1266759383 を参考に

;定義済みな関数群
(use srfi-19)

(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
		((divides? test-divisor n) test-divisor)
		(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (time-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-time)))

(define (start-prime-test n start-time)
  (if (prime? n)
	(report-prime (time-difference (current-time) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;自前定義

(define (find-primes-iter num count)
  (if (= count 0) (display "fin")
	(if (prime? num) (begin (display num) (newline) (find-primes-iter (+ num 1) (- count 1)))
	  (find-primes-iter (+ num 1) count))))

(define (find-primes start-num count)
  (find-primes-iter start-num count))

(define (find-primes-with-time-inner start-num count start-time)
  (find-primes start-num count)
  (display (time-difference (current-time) start-time)))

(define (find-primes-with-time start-num count)
  (find-primes-with-time-inner start-num count (current-time)))



(time-prime-test 3)
(time-prime-test 4)
(time-prime-test 5)

(find-primes-with-time 10 3)
(find-primes-with-time 100 3)
(find-primes-with-time 1000 3)
