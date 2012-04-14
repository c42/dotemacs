(setq load-path (cons "~/.emacs.d" load-path))
(require 'auto-package)
(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      starter-kit-ruby
                      starter-kit-eshell)
  "A list of packages to ensure are installed at launch.")

(auto-package-init)
(auto-package-install my-packages)

