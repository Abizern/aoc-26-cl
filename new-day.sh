#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <day-number>" >&2
  exit 1
fi

if ! [[ $1 =~ ^[0-9]+$ ]] || (( 10#$1 < 1 || 10#$1 > 12 )); then
  echo "Error: day number must be between 1 and 12" >&2
  exit 1
fi

cd "$(dirname "$0")"

day=$(printf "%02d" "$((10#$1))")
lisp_file="day${day}.lisp"
input_file="inputs/day${day}.txt"

if [[ -e "$lisp_file" ]]; then
  echo "Error: $lisp_file already exists" >&2
  exit 1
fi

mkdir -p inputs

cat > "$lisp_file" <<EOF
(uiop:define-package :aoc-26/day${day}
  (:use :cl :aoc-26/utils)
  ;; (:import-from :cl-ppcre #:split #:register-groups-bind)
  (:documentation ""))

(in-package :aoc-26/day${day})

;; For optimised SBCL builds, declare inside the function that needs it:
;;   (declare (optimize (speed 3) (safety 0) (debug 0)))

(defun parse-line (line)
  line)

(defun parse-input (lines)
  (mapcar #'parse-line lines))

;; =>
(defun part1 (&optional (input (parse-input (read-input :format :lines))))
  input)

;; =>
(defun part2 (&optional (input (parse-input (read-input :format :lines))))
  input)
EOF

touch "$input_file"

echo "Created ${lisp_file} and ${input_file}"
