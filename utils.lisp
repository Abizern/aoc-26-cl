;;;; All shared utilities, re-exported from one package.
;;;;
;;;; General-purpose utilities come from the CHALLENGE-UTILITIES library.
;;;; Utilities specific to this year's solution  live in their own package under
;;;; utils/, e.g. utils/input.lisp is AOC-26/UTILS/INPUT. Add new ones to
;;;; :USE-REEXPORT below. Day files can (:use :aoc-26/utils) to get everything,
;;;; or use individual utility packages. Exported names must be unique across
;;;; all of them.

(uiop:define-package :aoc-26/utils
  (:use :cl)
  (:use-reexport :challenge-utilities)
  (:use-reexport :aoc-26/utils/input)
  (:use-reexport :aoc-26/utils/solutions-helper)
  ;; Commonly used libraries. Importing nothing from them still makes them
  ;; dependencies of this system, so (ql:quickload "aoc-26") loads them and day
  ;; files can be compiled directly with C-c C-k.
  (:import-from :cl-ppcre)
  (:import-from :alexandria)
  (:import-from :ironclad))
