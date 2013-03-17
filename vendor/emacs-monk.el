;;; emacs-monk.el --- Send emacs shortcut to growl notification

;; Copyright (C) 2012 Niranjan Paranjape, Steven Deobald
;; Authors: Niranjan Paranjape, Steven Deobald
;; URL: http://github.com/c42/emacs-monk.el
;; Created: 2012
;; Version: 1.0
;; Keywords: growl emacs keybindings
;; Package-Requires: ((todochiku "0.0.8"))
;; Note:

;;; Commentary:
;;
;; This file is NOT part of GNU Emacs.
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; See <http://www.gnu.org/licenses/> for a copy of the GNU General
;; Public License.

;;; Code:

(require 'todochiku)
(defun emacs-monk-trim (s regex)
  (if (string-match regex s)
      (replace-match "" t t s)
    s))

(defun emacs-monk-trim-angles (s)
  (emacs-monk-trim (emacs-monk-trim s "^<") ">$"))

(setq emacs-monk-allowed-prefixes '("C-" "M-" "S-" "A-" "s-"))
(setq emacs-monk-blacklist '("C-up" "C-down" "C-right" "C-left" "M-right" "M-left" "M-up" "M-down" "C-a" "C-e" "C-x C-s"))

(defun emacs-monk-show-teachings (kbd cmd)
  (when (< 1 (length kbd))
    (let ((prefix (substring kbd 0 2)))
      (when (and (member prefix emacs-monk-allowed-prefixes) (not (member kbd emacs-monk-blacklist)))
        (todochiku-message kbd cmd "")))))

(defun emacs-monk-clean-inputs ()
  (emacs-monk-show-teachings (emacs-monk-trim-angles (key-description (this-command-keys)))
                  (symbol-name this-command)))

;; another useful heuristic for which keystrokes to keep:
;; stolen from:
;; http://lists.gnu.org/archive/html/help-gnu-emacs/2010-05/msg00875.html
;;
;; (unless (and (= (length (this-command-keys-vector)) 1)
;;              (eq (lookup-key global-map (this-command-keys)) this-command))
;;   ...)

(defun emacs-monk-flash-command ()
  (condition-case nil
      (emacs-monk-clean-inputs)
    ((debug error) nil)))

(defun emacs-monk-off ()
  (interactive)
  (remove-hook 'pre-command-hook 'emacs-monk-flash-command))

(defun emacs-monk-on ()
  (interactive)
  (add-hook 'pre-command-hook 'emacs-monk-flash-command))
(provide 'emacs-monk)
