(in-package :cl-user)
(defpackage thorn.doc
  (:use :cl)
  (:export :build-markdown-table)
  (:documentation "Generate a Markdown list of characters for the README."))
(in-package :thorn.doc)

(defparameter +header-format+
  "~%~A ~A~%~%")

(defparameter +table-header-format+
  "| Name | Character |~%| ---- | --------- |~%")

(defun build-markdown-table ()
  "Generate a Markdown table of the characters."
  (with-output-to-string (stream)
    (labels ((iterator (list depth)
               (if (listp (second list))
                   ;; We're at a section, write a heading and go through all the
                   ;; other elements
                   (progn
                     (format stream
                             +header-format+
                             (make-string depth :initial-element #\#)
                             (first list))
                     (when (eql (length (second list)) 2)
                       (format stream +table-header-format+))
                     (loop for elem in (rest list) do
                       (iterator elem (1+ depth))))
                   ;; We're at an input-output pair
                   (format stream
                           "| ``` ~A ``` | ~A |~%"
                           (first list)
                           (second list)))))
      (iterator thorn::*characters* 1))))
