(use-package org
  :mode (("\\.\\(org\\|org_archive\\)$" . org-mode))
  )

(use-package org-agenda
  :ensure nil
  :custom
  (org-agenda-files (directory-files-recursively
					 "~/Nextcloud/notes/"
					 "\.org$"))
  
  :general
  (my-leader
	"o a" '(org-agenda :wk "agenda")))


(use-package evil-org
  :after (org evil)
  :hook
  (org-mode-hook . evil-org-mode)
  (evil-org-mode-hook . (lambda ()
						  (evil-org-set-key-theme)))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))
