(in-package :com.burhanloey.clock)

(defparameter *output-path* "resources/public/js/script.js")

(setf *ps-print-pretty* nil)

(defun clean ()
  (if (probe-file *output-path*)
      (delete-file *output-path*)
      nil))

(defun transpile ()
  (with-open-file (out (ensure-directories-exist *output-path*)
                       :direction :output
                       :if-exists :supersede)
    (write-string (ps-compile-file "script.paren") out)))
