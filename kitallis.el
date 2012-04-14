(defvar personal-packages '(rvm)
  "A list of packages to ensure are installed at launch.")

(auto-package-install personal-packages)

(require 'molokai-theme)

;; use inconsolata
(set-face-attribute 'default nil
                    :family "Inconsolata"
                    :height 160)
