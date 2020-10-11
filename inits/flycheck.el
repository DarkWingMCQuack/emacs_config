(use-package flycheck
  :custom
  (flycheck-display-errors-delay 0.3)
  :config
  (global-flycheck-mode))



(use-package flycheck-popup-tip
  :after flycheck
  :config
  (add-hook 'flycheck-mode-hook 'flycheck-popup-tip-mode))
