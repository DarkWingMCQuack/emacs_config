(use-package evil
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  (setq evil-shift-width 2)
  :config
  (evil-mode 1))

(use-package evil-matchit
  :after evil
  :init
  (global-evil-matchit-mode 1))

(use-package evil-nerd-commenter
  :after evil)

(use-package evil-surround
  :ensure t
  :init
  (global-evil-surround-mode))

(use-package evil-collection
  :after evil
  :custom
  (evil-collection-setup-minibuffer t)
  (evil-collection-company-use-tng nil)
  :init (evil-collection-init))

(use-package evil-leader
  :after evil
  :init
  (global-evil-leader-mode)
  :config

  (defun my-open-term()
    (interactive)
    (split-window-below -15)
    (other-window -1)
    (term "/bin/bash"))
  (defun er-switch-to-previous-buffer ()
	"Switch to previously open buffer.
     Repeated invocations toggle between the two most recently open buffers."
	(interactive)
	(switch-to-buffer (other-buffer (current-buffer) 1)))


  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key

    ;;windows(the good type of windows)
    "wd"    'delete-window
    "wh"    'split-window-horizontally
    "wv"    'split-window-vertically
    "ww"    'other-window
    "wo"    'delete-other-windows

    ;;files
    "fs"    'save-buffer
    "ff"    'helm-find-files

    ;;shit
    "cc"    'evilnc-comment-or-uncomment-lines

    "t"     'my-open-term

    "gl"    'goto-line

    ;;exit emacs
    "qq"    'save-buffers-kill-terminal

    ;; buffers
    "bx"    'eval-buffer
    "bb"    'er-switch-to-previous-buffer
    "bf"    'switch-to-buffer
    "bd"    'kill-this-buffer))
