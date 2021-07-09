
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
  (helm-mode 1)
  (helm-autoresize-mode 1)

  (defun helm-find-files-navigate-forward (orig-fun &rest args)
	(if (and (equal "Find Files" (assoc-default 'name (helm-get-current-source)))
			 (equal args nil)
			 (stringp (helm-get-selection))
			 (not (file-directory-p (helm-get-selection))))
		(helm-maybe-exit-minibuffer)
      (apply orig-fun args)))

  (advice-add 'helm-execute-persistent-action :around #'helm-find-files-navigate-forward)

  (defun helm-find-files-navigate-back (orig-fun &rest args)
  (if (= (length helm-pattern) (length (helm-find-files-initial-input)))
      (helm-find-files-up-one-level 1)
    (apply orig-fun args)))

  (advice-add 'helm-ff-delete-char-backward :around #'helm-find-files-navigate-back)

  :general
  (general-define-key
   :keymaps 'helm-find-files-map

   "<return>" 'helm-execute-persistent-action))



(use-package swiper-helm
  :bind ("C-s" . swiper-helm))
