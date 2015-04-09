(defsystem thorn
  :author "Fernando Borretti <eudoxiahp@gmail.com>"
  :maintainer "Fernando Borretti <eudoxiahp@gmail.com>"
  :license "MIT"
  :version "0.1"
  :homepage "https://github.com/CommonDoc/thorn"
  :bug-tracker "https://github.com/CommonDoc/thorn/issues"
  :source-control (:git "git@github.com:CommonDoc/thorn.git")
  :depends-on (:common-doc)
  :components ((:module "src"
                :serial t
                :components
                ((:file "thorn"))))
  :description "A CommonDoc extension for entering special characters."
  :long-description
  #.(uiop:read-file-string
     (uiop:subpathname *load-pathname* "README.md"))
  :in-order-to ((test-op (test-op thorn-test))))
