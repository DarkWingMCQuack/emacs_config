(use-package undo-tree
  :diminish
  :init
  (global-undo-tree-mode 1)

  :config
  (custom-set-variables
   '(undo-tree-history-directory-alist
	 (quote (("." . "~/.emacs.d/undo/")))))

  :custom
  (undo-tree-visualizer-timestamps t)
  (undo-tree-auto-save-history t)

  :general
  (my-leader
	"u" '(undo-tree-visualize :wk "switch project"))

  (general-define-key
   :states 'normal

   "u" '(undo-tree-undo :wk "undo")
   "U" '(undo-tree-redo :wk "redo")))
