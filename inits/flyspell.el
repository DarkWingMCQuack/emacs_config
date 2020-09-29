(use-package flyspell
  :hook
  (prog-mode . flyspell-prog-mode)
  (text-mode . flyspell-mode)

  :custom
  (flyspell-issue-message-flag nil)

  ;; don't correct my strings
  ;; https://emacs.stackexchange.com/questions/31300/can-you-turn-on-flyspell-for-comments-but-not-strings
  (flyspell-prog-text-faces '(font-lock-comment-face font-lock-doc-face)))

(use-package flyspell-correct
  :after flyspell
  :general (general-define-key
			:keymaps 'flyspell-mode-map
			:states 'normal
			"c w" 'flyspell-correct-wrapper))
  
(use-package flyspell-correct-helm
  :after flyspell-correct)
