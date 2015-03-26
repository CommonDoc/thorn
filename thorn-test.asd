(defsystem thorn-test
  :author "Fernando Borretti <eudoxiahp@gmail.com>"
  :license "MIT"
  :description "Thorn tests."
  :depends-on (:thorn
               :thorn-doc
               :fiveam)
  :components ((:module "t"
                :components
                ((:file "thorn")))))
