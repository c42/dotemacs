(defvar personal-packages '(auto-complete)
  "A list of packages to ensure are installed at launch.")

(auto-package-install personal-packages)

(color-theme-sanityinc-solarized-dark)
(add-hook 'html-mode-hook 'turn-off-auto-fill)
(menu-bar-mode t)
(yas/global-mode 1)
