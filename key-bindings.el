(global-set-key (kbd "A-M-t") 'textmate-clear-cache)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\M-t" 'textmate-goto-file)

(global-set-key [kp-home]  'beginning-of-line)
(global-set-key [home]     'beginning-of-line)
(global-set-key [kp-end]   'end-of-line)
(global-set-key [end]      'end-of-line)
(global-set-key "\C-cy" 'browse-kill-ring)

(provide 'key-bindings)
