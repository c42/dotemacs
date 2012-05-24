(require 'molokai-theme)

;; use inconsolata
(set-face-attribute 'default nil
                    :family "Anonymous Pro"
                    :height 160)

(load-file "~/.emacs.d/elpa/todochiku-20120202/todochiku.el")

;; (defun show-teachings (cmd kbd)
;;   (message "V")
;;   (message cmd)
;;   (message kbd)
;;   (message "^")
;;   (when (< 1 (length kbd))
;;     (let ((prefix (substring kbd 0 2)))
;;       (when (member prefix '("C-" "M-"))
;;         (todochiku-message cmd kbd "")))))

(setq allowed-prefixes '("C-" "M-" "S-" "A-" "s-"))

(defun trim-angles (s)
  (if (string-match "^<" s)
      (replace-match "" t t s)
    s))

(defun show-teachings (kbd cmd)
  (print kbd)
  (when (< 1 (length kbd))
    (let ((prefix (substring kbd 0 2)))
      (when (member prefix allowed-prefixes)
        (todochiku-message kbd cmd "")))))

;; (defun clean-inputs ()
;;   (let ((stringy-elements (mapcar 'symbol-name (this-command-keys-vector))))
;;     (show-teachings (symbol-name this-command)
;;                     (mapconcat 'identity stringy-elements " "))))

(defun clean-inputs ()
;  (print (this-command-keys-vector))
;  (print (= (length (this-command-keys-vector)) 1))
;  (print (eq (lookup-key global-map (this-command-keys)) this-command))
  (show-teachings (trim-angles (key-description (this-command-keys)))
                  (symbol-name this-command)))

;; another useful heuristic for which keystrokes to keep:
;; stolen from:
;; http://lists.gnu.org/archive/html/help-gnu-emacs/2010-05/msg00875.html
;;
;; (unless (and (= (length (this-command-keys-vector)) 1)
;;              (eq (lookup-key global-map (this-command-keys)) this-command))
;;   ...)

(defun flash-command ()
  (condition-case nil
      (clean-inputs)
    ((debug error) nil)))

(defun flash-command-off ()
  (interactive)
  (remove-hook 'pre-command-hook 'flash-command))

;;(setq pre-command-hook nil)
(defun flash-command-on ()
  (interactive)
  (add-hook 'pre-command-hook 'flash-command))




