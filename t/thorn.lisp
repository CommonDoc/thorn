(in-package :cl-user)
(defpackage thorn-test
  (:use :cl :fiveam))
(in-package :thorn-test)

(def-suite tests
  :description "thorn tests.")
(in-suite tests)

(test character-table-works
  (is
   (equal (gethash "alpha" thorn:*character-table*)
          "α")))

(run! 'tests)
