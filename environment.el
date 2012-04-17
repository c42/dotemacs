
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


;; respek c42 dotfiles, which are dotless
(add-to-list 'auto-mode-alist '("zshrc" . sh-mode))
(add-to-list 'auto-mode-alist '("bashrc" . sh-mode))

;; Rake files are ruby, too, as are gemspecs, rackup files, etc.
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.thor$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Thorfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

;; turn off that fucking box
(setq ring-bell-function 'ignore)


(provide 'environment)
