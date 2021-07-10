(use-package ivy
  :config
  (ivy-mode)
  :general
  (general-define-key
   :keymaps 'ivy-minibuffer-map
   "C-j" 'ivy-immediate-done
   "RET" 'ivy-alt-done))

(use-package counsel
  :config
  (counsel-mode)
  :general
  (my-leader
	"f f" '(counsel-find-file :wk "find file")))

(use-package counsel-projectile
  :config
  (counsel-projectile-mode)
  :general
  (my-leader
	"p p" '(counsel-projectile-switch-project :wk "switch project")
	"p f" '(counsel-projectile-find-file :wk "find project file")))

(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))

;; More friendly interface for ivy
;; https://github.com/Yevgnen/ivy-rich
(use-package ivy-rich
  :after (ivy counsel-projectile counsel)
  :config
  (ivy-rich-mode 1)
  :custom
  ;; For better performance
  ;; Better experience with icons
  (ivy-rich-parse-remote-buffer nil))

;; Better experience with icons for ivy
;; https://github.com/seagle0128/all-the-icons-ivy-rich/
(use-package all-the-icons-ivy-rich
  :init
  (all-the-icons-ivy-rich-mode 1)
  :custom
  (all-the-icons-ivy-rich-icon-size 0.8))
