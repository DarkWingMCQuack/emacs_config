(use-package flycheck
  :init
  (global-flycheck-mode))

(use-package flyspell
  :hook
  (prog-mode-hook . flyspell-prog-mode)
  (text-mode-hook . flyspell-mode)

  :general
  (general-define-key
   :keymaps 'flyspell-mode-map
   :states 'normal
   "c w" 'flyspell-correct-word))

(use-package flycheck-popup-tip
  :hook (global-flycheck-mode . flycheck-popup-tip-mode))
