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
                      melpa)
  "A list of packages to ensure are installed at launch.")

;; packages TODO: helm or anything.el, projectile

;; custom TODO: ctags, maxframe on start

(auto-package-install my-packages)

;; show line numbers
(global-linum-mode t)

;; tabs are 2 spaces
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

(require 'environment)
(require 'key-bindings)

(require 'maxframe)
(require 'ruby-electric)
(require 'duplicate-line)
(require 'textmate)
(textmate-mode)
(ruby-electric-mode)
(add-hook 'window-setup-hook 'maximize-frame t)
