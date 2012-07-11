
(require 'find-file-in-project)

(defun generate-tags ()
  (interactive)
  (let ((root (ffip-project-root)))
    (let ((tags-file (concat root "TAGS")))
      (message "Regenerating TAGS file: %s" tags-file)
      (if (file-exists-p tags-file)
          (delete-file tags-file))
      (eshell-command
       (format "ctags -e --exclude=vendor --exclude=coverage -o %s -R %s" tags-file root))
      (if (get-file-buffer tags-file)
          (kill-buffer (get-file-buffer tags-file)))
      (visit-tags-table tags-file))))

(defun er-refresh-etags (&optional extension)
  "Run etags on all peer files in current dir and reload them silently."
  (interactive)
  ;;(shell-command (format "etags *.%s" (or extension "el")))
  (generate-tags)
  (let ((tags-revert-without-query t))  ; don't query, revert silently          
    (visit-tags-table default-directory nil)))

(defadvice find-tag (around refresh-etags activate)
  "Rerun etags and reload tags if tag not found and redo find-tag.
   If buffer is modified, ask about save before running etags."
  (let ((extension (file-name-extension (buffer-file-name))))
    (condition-case err
        ad-do-it
      (error (and (buffer-modified-p)
                  (not (ding))
                  (y-or-n-p "Buffer is modified, save it? ")
                  (save-buffer))
             (er-refresh-etags extension)
             ad-do-it))))

(provide 'generate-tags)
