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

  :general
  (general-define-key
   :keymaps 'company-active-map

   "<tab>"     '(company-select-next
				 :wk "cycle completion candidates")

   "<backtab>" '(company-select-previous
				 :wk "cycle completion candidates backwards")))

(use-package company-box
  :hook (company-mode . company-box-mode))

;; enable fuzzy matching
(use-package company-flx
  :after company
  :config
  (company-flx-mode 1))

(use-package company-statistics
  :hook
  (company-mode . company-statistics-mode))
