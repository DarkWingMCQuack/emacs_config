(use-package evil
  :custom
  (evil-want-integration t) ;; This is optional since it's already set to t by default.
  (evil-want-keybinding nil)
  (evil-shift-width 2)
  (evil-default-state 'normal)
  :config
  (evil-mode 1))

(use-package evil-matchit
  :after evil
  :custom
  (evilmi-shortcut "s")
  :init
  (global-evil-matchit-mode 1))

(use-package evil-nerd-commenter
  :after evil
  :general (general-define-key
			:states 'normal
			"c c" 'evilnc-comment-or-uncomment-lines))

(use-package evil-surround
  :init
  (global-evil-surround-mode))
