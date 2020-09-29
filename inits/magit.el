(use-package magit
  :commands magit-status
  :general

  (general-define-key
   :keymaps 'magit-mode-map
   :states 'normal
   "q" (lambda()
		 (interactive)
		 (magit-mode-bury-buffer t))))

(use-package evil-magit
  :after evil
  :init
  (evil-magit-init)
  :general
  (my-leader
	"g g" '(magit-status :wk "magit status")
	"g t" '(magit-todos-list :wk "show todos")
	"g p" '(magit-push :wk "push")))

(use-package magit-todos
  :after magit
  :hook (magit-mode . magit-todos-mode))

(use-package gitignore-mode
  :mode ("/\\.gitignore\\'"))
