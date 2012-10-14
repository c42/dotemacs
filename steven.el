(require 'molokai-theme)

(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 160)

(require 'find-file-in-project)
(defun open-project (dir)
  (interactive "DDirector: ")
  (cd dir)
  (ffip-project-root))

(require 'ascope)

(add-to-list 'load-path "~/.emacs.d/vendor/mustache-mode.el")
(require 'mustache-mode)

