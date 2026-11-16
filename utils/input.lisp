;;;; Utilities for finding and reading puzzle input files.

(uiop:define-package :aoc-26/utils/input
  (:use :cl)
  (:import-from :cl-ppcre
           #:scan-to-strings)
  (:export
   #:read-input
   #:input-path))

(in-package :aoc-26/utils/input)

(defun read-input-lines (day)
  "Return the puzzle input for the DAY as a list of strings, one per line."
  (uiop:read-file-lines (input-path day)))

(defun read-input-string (day)
  "Return the puzzle input for the DAY as a single string."
  (string-right-trim '(#\Newline #\Return) (uiop:read-file-string (input-path day))))

(defun package-day (package)
  "Return the day encoded in PACKAGE's name as an integer value.
Signal an error if the input doesn't match AOC-26/DAYNN"
  (let* ((package-name (package-name package))
         (match (nth-value 1 (scan-to-strings "(?i)aoc-26/day(\\d{2})" package-name))))
    (if match
        (parse-integer (aref match 0))
        (error "READ-INPUT used in non-conforming package: ~A" package-name))))

;; Public Interface

(defun input-path (day)
  "Return the pathname of the puzzle input for DAY.
The path is inputs/dayNN.txt"
  (asdf:system-relative-pathname
   "aoc-26"
   (format nil "inputs/day~2,'0d.txt" day)))

(defmacro read-input (&key (format :string))
  "Read the puzzle input for the day package that this is used in.
The day comes from the package name, so this only works inside a day's
solution file. FORMAT is one of:

  :STRING  the whole file as a single string, without trailing newlines
           (the default)

  :LINES   a list of strings, one per line"
  (let ((day (package-day *package*)))
    `(ecase ,format
      (:string (read-input-string ,day))
      (:lines (read-input-lines ,day)))))
