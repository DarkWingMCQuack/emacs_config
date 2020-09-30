(use-package org
  :mode (("\\.\\(org\\|org_archive\\)$" . org-mode))
  )

(use-package org-agenda
  :ensure nil
  
  :general
  (my-leader
	"o a" '(org-agenda :wk "agenda")))
