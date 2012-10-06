(defvar personal-packages '(auto-complete)
  "A list of packages to ensure are installed at launch.")

(auto-package-install personal-packages)

(set-face-attribute 'default nil
                    :family "Inconsolata"
                    :height 160)

(color-theme-sanityinc-solarized-dark)

(menu-bar-mode t)

