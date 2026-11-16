;;;; Utilities that make presenting solutions easier

(uiop:define-package :aoc-26/utils/solutions-helper
  (:use :cl)
  (:export #:solve-day))

(in-package :aoc-26/utils/solutions-helper)

(defmacro solve-day (execution-form)
  "Print both parts' answers, given as the two values of EXECUTION-FORM."
  (let ((result (gensym "RESULT-")))
    `(let ((,result (multiple-value-list ,execution-form)))
       (format t "Part 1: ~A~%" (first ,result))
       (format t "Part 2: ~A~%" (second ,result)))))
