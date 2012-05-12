(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10)
(A 2 4)
(A 3 3)


(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
(define (k n) (* 5 n n))

;f
(f 1)
(f 2)
(f 3)
(f 4)
(f 5)
;f = 2n

;g
(g 1)
(g 2)
(g 3)
(g 4)
(g 5)
;g = 2^n

;h
(h 1)
(h 2)
(h 3)
(h 4)
(h 5)
;h(n) = h(n-1)^2 
;h(1) = 2