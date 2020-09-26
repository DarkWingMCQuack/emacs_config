;; If you are about to read this bullshit there
;; is a high propability you will get eye-cancerweeee

(require 'smartparens (concat user-emacs-directory
							  (convert-standard-filename "inits/smartparens.el")))

(defun advanced-return ()
  "Advanced `newline' command for comment.  This function redefine <Enter> to
provide a corrent comment symbol at each newline plus a space when you press
<Enter> in the comment.  It also support JavaDoc style comment -- insert a `*'
at the beggining of the new line if inside of a comment."
  (interactive "*")
  (let* ((last (point))
         (line-beginning 
		  (progn (beginning-of-line) 
				 (point)))

		 (is-inside-oneline-comment
		  (let* ((line (thing-at-point 'line t))
				 (regexp (concat "[[:space:]]*" comment-start ".*$")))
			(string-match regexp line))
		  )

         (is-inside-multiline-comment
          (progn
            (goto-char last)
            (if (search-backward "*/" nil t)
                ;; there are some comment endings - search forward
                (search-forward "/*" last t)
              ;; it's the only comment - search backward
              (goto-char last)
              (search-backward "/*" nil t)))))

    ;; go to last char position
    (goto-char last)

    (if is-inside-oneline-comment
		(comment-indent-new-line)
      ;; else we check if it is java-doc style comment.
      (if is-inside-multiline-comment
          (progn
			(insert "\n* ")
			(indent-for-tab-command))
        ;; else insert only new-line
        (newline-and-indent)))))

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
  "Deletes all whitespace behind of cursor."
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
         (looking-at-p "[[:space:]]*)")
         (not
          (looking-back 
		   ",[[:space:]]*" 
		   nil)))
        (progn
          (delete-ws-forward)
          (delete-ws-backward)
          (sp-up-sexp))
      (advanced-return))))

;;activate my super return in every prog enviroment
(add-hook 'prog-mode-hook (lambda ()
                            (local-set-key (kbd "<RET>") 'my-super-return)))
