(use-package projectile
  :diminish projectile-mode
  :custom
  (projectile-completion-system 'helm)
  (projectile-create-missing-test-files t)
  (projectile-switch-project-action 'projectile-find-file)

  :config
  (projectile-mode)

  :general
  (my-leader
	"p p" '(projectile-switch-project :wk "switch project")
	"p a" '(projectile-find-other-file :wk "find other file")
	"p f" '(projectile-find-file :wk "find project file")))


(use-package helm-projectile
  :after (projectile helm)
  :init
  (helm-projectile-on)
  :custom
  (helm-for-files-preferred-list
   '(helm-source-buffers-list
	 helm-source-projectile-files-list
	 helm-source-recentf
	 helm-source-bookmarks
	 helm-source-file-cache
	 helm-source-files-in-current-dir
	 helm-source-locate)))
