(use-package evil-snipe
  :after evil

  :hook
  (magit-mode-hook . turn-off-evil-snipe-override-mode)

  :init
  (evil-snipe-override-mode 1)
  (evil-snipe-mode 1)

  :custom
  (evil-snipe-scope 'buffer)

  :general
  (general-define-key
   :states 'normal
   "n" 'evil-snipe-repeat
   "N" 'evil-snipe-repeat-reverse))
