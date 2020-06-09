(use-package auctex
  :mode ("\\.tex\\'" . latex-mode)
  :commands (latex-mode LaTeX-mode plain-tex-mode)
  :hook
  ((LaTeX-mode-hook . LaTeX-preview-setup)
   (LaTeX-mode-hook . turn-on-reftex))
  :init
  (setq TeX-auto-save t
        TeX-parse-self t
        TeX-save-query nil
        TeX-show-compilation nil
        TeX-PDF-mode t)

  (setq-default TeX-master nil))

(use-package company-auctex
  :after company
  :init (company-auctex-init))

(use-package reftex
  :commands turn-on-reftex
  :ensure t
  :after auctex
  :init
  (setq reftex-plug-into-AUCTeX t))

(use-package bibtex
  :mode ("\\.bib" . bibtex-mode)
  :ensure t
  :init
  (setq bibtex-align-at-equal-sign t))
