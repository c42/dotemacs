
;; fix the PATH variable
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(if window-system (set-exec-path-from-shell-PATH))


;; emacs configuration directory based on this file's location
(setq emacs-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path (concat emacs-dir "/vendor"))


;; set up emacs shitty customizations UI
(setq custom-file "~/.emacs.d/custom.el")
(load-file "~/.emacs.d/custom.el")


;; fix the command key to be meta -- old and busted
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
;; fix the command key to be meta -- new hotness
(setq mac-option-modifier 'alt)
(setq mac-command-modifier 'meta)


;; save backup files to /tmp
(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))


(provide 'environment)
