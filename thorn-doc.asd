(defsystem thorn-doc
  :author "Fernando Borretti <eudoxiahp@gmail.com>"
  :license "MIT"
  :description "Generate a Markdown character list."
  :depends-on (:thorn)
  :components ((:module "src"
                :components
                ((:file "doc")))))
