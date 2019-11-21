#!/usr/local/bin/sbcl --script

;; loads common utils
(load "util.lisp")

(defun range (from &optional to (step 1))
  (cond ((null to) (range 0 from 1))
        ((<= (* (- to from) step) 0) nil) ;; check if step moves in right direction
        ((equal from to) nil)
        (t (cons from (range (+ from step) to step)))))

;;
;; Factorial with range
;;
(defun factorial (n)
  (apply #'* (range 1 (+ 1 n))))

; 0! = 1
(pex (factorial 0))
; 5! = 120
(pex (factorial 5))