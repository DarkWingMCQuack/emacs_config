;;; ui-config.el ---

;; disable ugly ass bullshit
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(defun my/disable-scroll-bars (frame)
  (modify-frame-parameters frame
                           '((vertical-scroll-bars . nil)
                             (horizontal-scroll-bars . nil))))

(add-hook 'after-make-frame-functions 'my/disable-scroll-bars)
(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; set font
(setq default-frame-alist '((font . "Source Code Pro-10")))


;; stop prompting me, allright?
;; a) y is yes and n is no
(fset 'yes-or-no-p 'y-or-n-p)


(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  ;; (load-theme 'doom-vibrant t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config))

(use-package gruvbox-theme
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'gruvbox-dark-hard t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config))

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :config
  (setq evil-normal-state-tag   (propertize "[Normal]" 'face '((:background "green" :foreground "black")))
        evil-emacs-state-tag    (propertize "[Emacs]" 'face '((:background "orange" :foreground "black")))
        evil-insert-state-tag   (propertize "[Insert]" 'face '((:background "red") :foreground "white"))
        evil-motion-state-tag   (propertize "[Motion]" 'face '((:background "blue") :foreground "white"))
        evil-visual-state-tag   (propertize "[Visual]" 'face '((:background "grey80" :foreground "black")))
        evil-operator-state-tag (propertize "[Operator]" 'face '((:background "purple"))))
  (setq doom-modeline-icon t)
  (setq doom-modeline-height 20))
;; ;;; ui-config.el ends here
