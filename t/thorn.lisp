(in-package :cl-user)
(defpackage thorn-test
  (:use :cl :fiveam)
  (:import-from :thorn
                :*character-table*
                :letter)
  (:import-from :common-doc
                :text-node
                :text)
  (:import-from :common-doc.util
                :make-text))
(in-package :thorn-test)

(def-suite tests
  :description "thorn tests.")
(in-suite tests)

(test build-table-works
  (is
   (typep (thorn::build-character-table) 'hash-table)))

(test character-table-works
  (is
   (equal (gethash "alpha" *character-table*)
          "α")))

(test macro-works
  (let* ((node (make-instance 'letter
                              :children
                              (list
                               (make-text "alpha"))))
         (expanded (common-doc.macro:expand-macro node)))
    (is-true (typep expanded 'text-node))
    (is
     (equal (text expanded)
            "α"))))

(test docgen-works
  (finishes
    (thorn.doc:build-markdown-table)))

(run! 'tests)
