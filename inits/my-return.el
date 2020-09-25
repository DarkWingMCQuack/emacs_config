;; If you are about to read this bullshit there
;; is a high propability you will get eye-cancer
(require 'smartparens (concat user-emacs-directory
							  (convert-standard-filename "inits/smartparens.el")))

(defun my-doxygen-return ()
  "Advanced for Javadoc multiline comments.
Inserts `*' at the beggining of the new line if
unless return was pressed outside the comment"
  (interactive)
  (setq last (point))
  (setq is-inside
        (if (search-backward "*/" nil t)
            ;; there are some comment endings - search forward
            (search-forward "/*" last t)
          ;; it's the only comment - search backward
          (goto-char last)
          (search-backward "/*" nil t)
          )
        )
  ;; go to last char position
  (goto-char last)
  ;; the point is inside some comment, insert `* '
  (if is-inside
      (progn
        (insert "\n* ")
        (indent-for-tab-command))
    ;; else insert only new-line
    (newline-and-indent)))

(defun delete-ws-forward ()
  "Deletes all whitespace in front of cursor."
  (interactive)
  (delete-region (point)
                 (progn
                   (while (or (equal (char-after) ? )
                              (eolp))
                     (forward-char))
                   (point))))

(defun delete-ws-backward ()
  "Deletes all whitespace front of cursor."
  (interactive)
  (delete-region (point)
                 (progn
                   (while (or (equal (char-before) ? )
                              (eolp))
                     (backward-char))
                   (point))))

(defun my-super-return ()
  "My super return check for c like languages.
if we are in an sexp and dont have a , before the cursor
we delete ws before and after the cursor and then jump out of the sexp
if not we just trigger my-doxygen-return"
  (interactive)
  (progn
    (if (and
         (looking-at-p "[[:space:]]*[)>]")
         (not
          (looking-back ",[[:space:]]*")))
        (progn
          (delete-ws-forward)
          (delete-ws-backward)
          (sp-up-sexp))
      (my-doxygen-return))))

;;activate my super return in every prog enviroment
(add-hook 'prog-mode-hook (lambda ()
                            (local-set-key (kbd "<RET>") 'my-super-return)))
