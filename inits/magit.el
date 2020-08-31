(use-package magit
  :commands magit-status)

(use-package evil-magit
  :after evil
  :config
  (evil-leader/set-key
    "gg" 'magit-status
    "gp" 'magit-push))

(use-package magit-todos
  :after magit
  :hook (magit-mode-hook . magit-todos-mode))

(use-package gitignore-mode
  :mode ("/\\.gitignore\\'"))
