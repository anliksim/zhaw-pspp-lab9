#!/usr/local/bin/sbcl --script

;; loads common utils
(load "util.lisp")

;;
;; Mapping over a list
;;
(defun map-list (f seq)
  (cond ((null seq) nil)
        (t (cons (funcall f (car seq))
                 (map-list f (cdr seq))))))

;; or as an iterative implementation
;(defun map-list (f seq) 
;    (loop for el in seq collect (funcall f el)))


;;
;; Sum of all list elements
;;
(defun list-sum (seq) 
  (cond ((null seq) 0)
        (t (+ (car seq) (list-sum (cdr seq))))))


;;
;; Product of all list elements
;;
(defun list-mult (seq) 
  (cond ((null seq) 1)
        (t (* (car seq) (list-mult (cdr seq))))))


;;
;; Abstraction
;;
(defun reduce-list (f init seq)
 (cond ((null seq) init)
        (t (funcall f (car seq) (reduce-list f init (cdr seq))))))


(pex (list-sum '(10 20 7)))
(pex (reduce-list #'+ 0 '(10 20 7)))

(pex (list-mult '(10 7)))
(pex (reduce-list #'* 1 '(10 7)))


;;
;; Another frequently used list abstraction
;; Find a better name
;;
(defun filter-list (f seq)
  (cond ((null seq) nil)
        ((funcall f (car seq))
         (cons (car seq) (filter-list f (cdr seq))))
        (t (filter-list f (cdr seq)))))

(pex (filter-list #'(lambda (x) (> x 9)) '(10 20 7)))


