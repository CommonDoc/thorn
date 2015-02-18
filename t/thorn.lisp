(in-package :cl-user)
(defpackage thorn-test
  (:use :cl :fiveam))
(in-package :thorn-test)

(def-suite tests
  :description "thorn tests.")
(in-suite tests)

(test simple-test
  (is
   (equal 1 1))
  (is-true
   (and t t)))

(run! 'tests)
