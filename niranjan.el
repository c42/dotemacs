(defvar personal-packages '(rvm)
  "A list of packages to ensure are installed at launch.")

(auto-package-install personal-packages)

(color-theme-sanityinc-solarized-dark)
