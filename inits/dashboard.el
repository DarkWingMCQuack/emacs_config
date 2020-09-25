(use-package dashboard
  :custom
  (dashboard-startup-banner "~/.emacs.d/gnu2.png")
  (dashboard-image-banner-max-height 10)
  (dashboard-init-info nil)
  (dashboard-set-init-info nil)
  (dashboard-set-footer nil)
  (dashboard-items '((recents  . 5)
					 (projects . 5)
					 (agenda . 5)
					 (registers . 5)))
  (initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

  :config
  (dashboard-setup-startup-hook))
