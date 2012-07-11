(setq load-path (cons "~/.emacs.d" load-path))
(require 'auto-package)

(defvar my-packages '(melpa

                      starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      starter-kit-eshell
                      ;; themes
                      color-theme-sanityinc-solarized
                      molokai-theme

                      ;; clojure
                      clojure-mode
                      clojure-test-mode

                      clojurescript-mode

                      ;; ruby
                      rinari
                      rspec-mode

                      ;; js
                      js2-mode

                      ;; markup
                      haml-mode
                      less-css-mode
                      sass-mode
                      scss-mode
                      markdown-mode

                      ;; flymake
                      flymake-shell
                      flymake-ruby
                      flymake-haml
                      flymake-css

                      ;; navigation
                      ack-and-a-half
                      ascope

                      ;; editing
                      auto-complete
                      smooth-scrolling
                      browse-kill-ring
                      undo-tree
                      yasnippet

                      ;; utils
                      magit
                      melpa
                      todochiku)
  "A list of packages to ensure are installed at launch.")

;; packages TODO: helm or anything.el, projectile

;; custom TODO: ctags, maxframe on start

(auto-package-install my-packages)

;; tabs are 2 spaces
(setq-default tab-width 2)
(setq css-indent-offset 2)
(setq js-indent-level 2)
(setq js2-basic-offset 2)
(setq-default indent-tabs-mode nil)
(setq scss-compile-at-save nil)

(require 'environment)
(require 'key-bindings)

(require 'maxframe)
(require 'ruby-electric)
(require 'duplicate-line)
(require 'textmate)
(require 'emacs-monk)
(textmate-mode)
(global-undo-tree-mode)
(global-linum-mode t)
(yas/global-mode 1)
(add-hook 'ruby-mode-hook 'ruby-electric-mode)
(add-hook 'window-setup-hook 'maximize-frame t)
(add-hook 'html-mode-hook 'turn-off-auto-fill)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
