(setq load-path (cons "~/.emacs.d" load-path))
(require 'auto-package)

(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      starter-kit-ruby
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
                      browse-kill-ring
                      undo-tree
                      yasnippet
                      
                      ;; utils
                      magit)
  "A list of packages to ensure are installed at launch.")

;; packages TODO: maxframe

;; melpa packages TODO: ruby-electric, textmate, smooth-scrolling

;; bug TODO: rspec-mode should autoload

;; custom TODO: ctags, maxframe on start

(auto-package-install my-packages)

;; show line numbers
(global-linum-mode t)

;; tabs are 2 spaces
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

(require 'environment)
(require 'key-bindings)

(require 'smooth-scrolling)
(require 'duplicate-line)
(require 'textmate)
(textmate-mode)
