(use-package company
  :init
  (global-company-mode)

  :custom
  (company-idle-delay 0)
  (company-minimum-prefix-length 1)
  (company-echo-delay 0)
  (company-auto-commit nil)
  (company-show-numbers t)
  (company-tooltip-limit 15)
  (company-selection-wrap-around t)
  (company-require-match 'never)

  :config
  (delete 'company-dabbrev company-backends)
  (delete 'company-nxml company-backends)
  (delete 'company-eclim company-backends)
  (delete 'company-xcode company-backends)
  (delete 'company-capf company-backends)
  (delete 'company-dabbrev-code company-backends)
  (delete 'company-gtags company-backends)
  (delete 'company-etags company-backends)
  (delete 'company-clang company-backends)
  (delete 'company-bbdb company-backends)
  (delete 'company-css company-backends)
  (delete 'company-semantic company-backends)

  (defun ora-company-number ()
	"Forward to `company-complete-number'.
     Unless the number is potentially part of the candidate.
     In that case, insert the number."
	(interactive)
	(let* ((k (this-command-keys))
           (re (concat "^" company-prefix k)))
      (if (cl-find-if (lambda (s) (string-match re s))
                      company-candidates)
          (self-insert-command 1)
		(company-complete-number (string-to-number k)))))

  (mapc
   (lambda (x)
	 (define-key company-active-map (format "%d" x) 'ora-company-number))
   (number-sequence 0 9))

  :general
  (general-define-key
   :keymaps 'company-active-map

   "<tab>"     '(company-select-next
				 :wk "cycle completion candidates")

   "<backtab>" '(company-select-previous
				 :wk "cycle completion candidates backwards")))

(use-package company-box
  :after company
  :hook
  (company-mode . company-box-mode))

;; enable fuzzy matching
(use-package company-flx
  :after company
  :config
  (company-flx-mode 1))

(use-package company-statistics
  :after company
  :hook
  (company-mode . company-statistics-mode))
