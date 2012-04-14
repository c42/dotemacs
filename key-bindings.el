
;; textmate
(global-set-key (kbd "A-M-t") 'textmate-clear-cache)
(global-set-key (kbd "M-t") 'textmate-goto-file)

;; rspec
(add-hook 'rspec-mode-hook
          (lambda () 
            (local-set-key (kbd "A-r") 'rspec-verify)
            (local-set-key (kbd "A-R") 'rspec-verify-single)
            (local-set-key (kbd "A-C-<down>") 'rspec-toggle-spec-and-target)))

;; steve yegge's keybindings to match terminal
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)

(global-set-key [kp-home]  'beginning-of-line)
(global-set-key [home]     'beginning-of-line)
(global-set-key [kp-end]   'end-of-line)
(global-set-key [end]      'end-of-line)
(global-set-key "\C-cy" 'browse-kill-ring)
(global-set-key "\C-cd" 'duplicate-line)

(global-set-key [f6] 'magit-status)

(provide 'key-bindings)