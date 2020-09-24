(use-package evil
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  (setq evil-shift-width 2)
  :config
  (evil-mode 1))

(use-package evil-matchit
  :after evil
  :init
  (global-evil-matchit-mode 1))

(use-package evil-nerd-commenter
  :after evil
  :general (general-define-key
			:states 'normal
			"c c" 'evilnc-comment-or-uncomment-lines))
			
(use-package evil-surround
  :ensure t
  :init
  (global-evil-surround-mode))

(use-package evil-collection
  :after evil
  :custom
  (evil-collection-setup-minibuffer t)
  (evil-collection-company-use-tng nil)
  :init (evil-collection-init))
