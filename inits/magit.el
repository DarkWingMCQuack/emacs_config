(use-package magit
  :commands magit-status
  :general
  (general-define-key
   :keymaps 'magit-mode-map
   :states 'normal
   "q" (lambda()
		 (interactive)
		 (magit-mode-bury-buffer t)))

  (general-define-key
   :keymaps 'transient-map
   "q" 'transient-quit-one
   "<escape>" 'transient-quit-one)

  (general-define-key
   :keymaps 'transient-edit-map
   "q" 'transient-quit-one
   "<escape>" 'transient-quit-one)

  (general-define-key
   :keymaps 'transient-sticky-map
   "q" 'transient-quit-seq
   "<escape>" 'transient-quit-seq))

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
