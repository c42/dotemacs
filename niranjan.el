(defvar personal-packages '(auto-complete)
  "A list of packages to ensure are installed at launch.")

(auto-package-install personal-packages)

(color-theme-sanityinc-solarized-dark)
(require 'auto-complete)
(global-auto-complete-mode)
