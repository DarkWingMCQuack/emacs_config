(use-package undo-tree
  :diminish
  :config
  (custom-set-variables
   '(undo-tree-history-directory-alist
	 (quote (("." . "~/.emacs.d/undo/")))))

  :general
  (my-leader
   "u" '(undo-tree-visualize :wk "switch project")))
