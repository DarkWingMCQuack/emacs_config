;;; init.el --- this file loads all the init files of my config  -*- lexical-binding: t; -*-

;; Copyright (C) 2018

;; Author:  <lukas@GentooPad>
;; Keywords: tools, tools, abbrev

;;; Commentary:


;;; Code:


(defvar local-dir user-emacs-directory
  "The root dir of the Emacs configuration.")

(defun local-file-name (file-name)
  (let* ((file-path (expand-file-name file-name local-dir))
         (parent-dir (file-name-directory file-path)))
    (unless (or (not parent-dir)
                (file-exists-p parent-dir))
      (make-directory parent-dir))
    file-path))


;;load core
(load (local-file-name "core/core-server"))
(load (local-file-name "core/core-packages"))
(load (local-file-name "core/core-env"))

(load (local-file-name "inits/general"))

(load (local-file-name "inits/auto-package-updater"))
(load (local-file-name "inits/dired"))
(load (local-file-name "inits/regexp"))
(load (local-file-name "inits/evil"))
(load (local-file-name "inits/snipe"))
(load (local-file-name "inits/avy"))
(load (local-file-name "inits/prettify-symbols"))
(load (local-file-name "inits/helm"))
(load (local-file-name "inits/lsp"))
(load (local-file-name "inits/cquery"))
(load (local-file-name "inits/go"))
(load (local-file-name "inits/rust"))
(load (local-file-name "inits/my-return"))
(load (local-file-name "inits/cmake"))
(load (local-file-name "inits/cpp"))
(load (local-file-name "inits/crux"))

;;load the rest
(load (local-file-name "inits/ui-config"))
(load (local-file-name "inits/indent-guide"))
(load (local-file-name "inits/linum"))
(load (local-file-name "inits/drag-stuff"))
(load (local-file-name "inits/hideshow"))
(load (local-file-name "inits/which-key"))
(load (local-file-name "inits/flycheck"))
(load (local-file-name "inits/flyspell"))
(load (local-file-name "inits/yasnippet"))
(load (local-file-name "inits/company"))
(load (local-file-name "inits/projectile"))
(load (local-file-name "inits/magit"))
(load (local-file-name "inits/elisp"))
(load (local-file-name "inits/haskell"))
(load (local-file-name "inits/file-handling"))
(load (local-file-name "inits/undotree"))
(load (local-file-name "inits/neotree"))
(load (local-file-name "inits/rainbow"))
(load (local-file-name "inits/smartparens"))
(load (local-file-name "inits/markdown"))
(load (local-file-name "inits/scala"))
(load (local-file-name "inits/git-gutter"))
(load (local-file-name "inits/docker"))
(load (local-file-name "inits/typescript"))
(load (local-file-name "inits/dashboard"))
(load (local-file-name "inits/org"))

(load (local-file-name "inits/keybindings"))


;;custom.el bullshit
(setq custom-file (local-file-name "custom.el"))
(load custom-file t)


;;; init.el ends here
(put 'dired-find-alternate-file 'disabled nil)
