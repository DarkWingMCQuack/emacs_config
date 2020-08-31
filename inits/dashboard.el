(use-package dashboard
  :init
  (setq dashboard-startup-banner "~/.emacs.d/gnu2.png")
  (setq dashboard-image-banner-max-height 10)
  (setq dashboard-init-info nil)
  (setq dashboard-set-init-info nil)
  (setq dashboard-set-footer nil)
  (setq dashboard-items '((recents  . 5)
                          (projects . 5)
                          (agenda . 5)
                          (registers . 5)))
  :config
  (setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
  (dashboard-setup-startup-hook))
