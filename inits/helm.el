
(use-package helm
  :demand t
  :diminish helm-mode
  :bind
  ("M-x" . helm-M-x)
  ("M-p" . helm-show-kill-ring)

  :custom
  (helm-M-x-fuzzy-match t)
  (helm-buffers-fuzzy-matching t)
  (helm-display-header-line nil)

  :config
  (defun my/helm-find-files-navigate-forward (orig-fun &rest args)
	(if (and (equal "Find Files" (assoc-default 'name (helm-get-current-source)))
			 (equal args nil)
			 (stringp (helm-get-selection))
			 (not (file-directory-p (helm-get-selection))))
		(helm-maybe-exit-minibuffer)
      (apply orig-fun args)))

  (defun my/helm-find-files-navigate-back (orig-fun &rest args)
	(if (= (length helm-pattern) (length (helm-find-files-initial-input)))
		(helm-find-files-up-one-level 1)
      (apply orig-fun args)))

  (advice-add 'helm-execute-persistent-action :around #'my/helm-find-files-navigate-forward)
  (advice-add 'helm-ff-delete-char-backward :around #'my/helm-find-files-navigate-back)
  (define-key helm-find-files-map (kbd "<return>") 'helm-execute-persistent-action)
  (helm-mode 1)
  (helm-autoresize-mode 1))

(use-package swiper-helm
  :bind ("C-s" . swiper-helm))
