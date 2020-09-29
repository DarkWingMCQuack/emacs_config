(use-package flycheck
  :init
  (global-flycheck-mode))



(use-package flycheck-popup-tip
  :hook (global-flycheck-mode . flycheck-popup-tip-mode))
