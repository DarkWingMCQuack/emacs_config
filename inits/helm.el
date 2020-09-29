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
  (helm-autoresize-mode 1))

(use-package swiper-helm
  :bind ("C-s" . swiper-helm))
