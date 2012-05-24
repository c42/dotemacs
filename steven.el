(require 'molokai-theme)

;; use inconsolata
(set-face-attribute 'default nil
                    :family "Anonymous Pro"
                    :height 160)

(load-file "~/.emacs.d/elpa/todochiku-20120202/todochiku.el")

(defun show-teachings (cmd kbd)
  (message "V")
  (message cmd)
  (message kbd)
  (message "^")
  (when (< 1 (length kbd))
    (let ((prefix (substring kbd 0 2)))
      (when (member prefix '("C-" "M-"))
        (todochiku-message cmd kbd "")))))

(defun clean-inputs ()
  (print (this-command-keys-vector))
  (let ((stringy-elements (mapcar 'symbol-name (this-command-keys-vector))))
    (show-teachings (symbol-name this-command)
                    (mapconcat 'identity stringy-elements " "))))

(defun pre-command-hook-callback ()
  (condition-case nil
      (clean-inputs)
    ((debug error) nil)))

;;(setq pre-command-hook nil)
(add-hook 'pre-command-hook 'pre-command-hook-callback)



