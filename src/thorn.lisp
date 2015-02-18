(in-package :cl-user)
(defpackage thorn
  (:use :cl)
  (:export :*character-table*)
  (:documentation "The main package of Thorn."))
(in-package :thorn)

(defparameter *characters*
  `("List of Characters"
    ("Diacritical Marks"
     ("Acute Accent"
      ("`a" "á")
      ("`A" "Á")))
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
     ("sdash" "⁓"))))

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
