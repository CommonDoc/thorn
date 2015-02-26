(in-package :cl-user)
(defpackage thorn
  (:use :cl)
  (:import-from :common-doc
                :define-node
                :text-node
                :children
                :text)
  (:import-from :common-doc.macro
                :macro-node
                :expand-macro)
  (:export :*character-table*
           :letter)
  (:documentation "The main package of Thorn."))
(in-package :thorn)

(defparameter *characters*
  `("List of Characters"
    ("Diacritical Marks"
     ("Acute Accent"
      ("'a" "á")
      ("'A" "Á")
      ("'c" "ć")
      ("'C" "Ć")
      ("'e" "é")
      ("'E" "É")
      ("'g" "ǵ")
      ("'G" "Ǵ")
      ("'i" "í")
      ("'I" "Í")
      ("'k" "ḱ")
      ("'K" "Ḱ")
      ("'l" "ĺ")
      ("'L" "Ĺ")
      ("'m" "ḿ")
      ("'M" "Ḿ")
      ("'n" "ń")
      ("'N" "Ń")
      ("'o" "ó")
      ("'O" "Ó")
      ("'p" "ṕ")
      ("'P" "Ṕ")
      ("'r" "ŕ")
      ("'R" "Ŕ")
      ("'s" "ś")
      ("'S" "Ś")
      ("'u" "ú")
      ("'U" "Ú")
      ("'w" "ẃ")
      ("'W" "Ẃ")
      ("'y" "ý")
      ("'Y" "Ý")
      ("'z" "ź")
      ("'Z" "Ź"))
     ("Double Acute Accent"
      ("''a" "a̋")
      ("''A" "A̋")
      ("''e" "e̋")
      ("''E" "E̋")
      ("''i" "i̋")
      ("''I" "I̋")
      ("''o" "ő")
      ("''O" "Ő")
      ("''u" "ű")
      ("''U" "Ű")))
    ("Scripts"
     ("Greek"
      ("alpha" "α")
      ("Alpha" "Α")
      ("beta" "β")
      ("Beta" "Β")
      ("gamma" "γ")
      ("Gamma" "Γ")
      ("delta" "δ")
      ("Delta" "Δ")
      ("epsilon" "ε")
      ("Epsilon" "Ε")
      ("zeta" "ζ")
      ("Zeta" "Ζ")
      ("eta" "η")
      ("Eta" "Η")
      ("theta" "θ")
      ("Theta" "Θ")
      ("iota" "ι")
      ("Iota" "Ι")
      ("kappa" "κ")
      ("Kappa" "Κ")
      ("lambda" "λ")
      ("Lambda" "Λ")
      ("mu" "μ")
      ("Mu" "Μ")
      ("nu" "ν")
      ("Nu" "Ν")
      ("xi" "ξ")
      ("Xi" "Ξ")
      ("omicron" "ο")
      ("Omicron" "Ο")
      ("pi" "π")
      ("Pi" "Π")
      ("rho" "ρ")
      ("Rho" "Ρ")
      ("sigma" "σ")
      ("fsigma" "ς")
      ("Sigma" "Σ")
      ("tau" "τ")
      ("Tau" "Τ")
      ("upsilon" "υ")
      ("Upsilon" "Υ")
      ("phi" "φ")
      ("Phi" "Φ")
      ("chi" "χ")
      ("Chi" "Χ")
      ("psi" "ψ")
      ("Psi" "Ψ")
      ("omega" "ω")
      ("Omega" "Ω")))
    ("Punctuation"
     ("ndash" "–")
     ("mdash" "—")
     ("sdash" "⁓"))
    ("Other"
     ("ae" "æ")
     ("AE" "Æ"))))

(defun build-character-table ()
  "Recur through *characters*, building a hash table of characters."
  (let ((table (make-hash-table :test #'equal)))
    (labels ((iterator (list)
               (if (listp (second list))
                   ;; We're at a section, go through all the other elements
                   (loop for elem in (rest list) do
                     (iterator elem))
                   ;; We're at an input-output pair
                   (setf (gethash (first list) table)
                         (second list)))))
      (iterator *characters*))
    table))

(defvar *character-table* (build-character-table)
  "A hash table that maps the name of a character to its resulting string.")

;;; Macro

(define-node letter (macro-node)
  ()
  (:tag-name "l")
  (:documentation "Letter macro."))

(defmethod expand-macro ((node letter))
  "Expand the letter macro."
  (let ((text-node (first (children node))))
    (let ((text (text text-node)))
      (make-instance 'text-node
                     :text (gethash text *character-table*)))))
