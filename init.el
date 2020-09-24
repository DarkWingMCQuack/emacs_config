;;; init.el --- this file loads all the init files of my config  -*- lexical-binding: t; -*-

;; Copyright (C) 2018

;; Author:  <lukas@GentooPad>
;; Keywords: tools, tools, abbrev

;;; Commentary:


;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; i dont know why, but this is needed
(require 'tramp)

;;start emacs as a server such that we can use emacsclient
(server-start)

(defvar local-dir user-emacs-directory
  "The root dir of the Emacs configuration.")

(defun local-file-name (file-name)
  (let* ((file-path (expand-file-name file-name local-dir))
         (parent-dir (file-name-directory file-path)))
    (unless (or (not parent-dir)
                (file-exists-p parent-dir))
      (make-directory parent-dir))
    file-path))

(setq load-prefer-newer t)


;;load core
(load (local-file-name "core/core-packages"))
(load (local-file-name "core/core-env"))

(load (local-file-name "inits/auto-package-updater"))
(load (local-file-name "inits/evil"))
(load (local-file-name "inits/prettify-symbols"))
(load (local-file-name "inits/helm"))
(load (local-file-name "inits/lsp"))
(load (local-file-name "inits/cquery"))
(load (local-file-name "inits/cpp"))
(load (local-file-name "inits/go"))
(load (local-file-name "inits/rust"))
(load (local-file-name "inits/my-return"))
(load (local-file-name "inits/cmake"))

;;load the rest
(load (local-file-name "inits/ui-config"))
(load (local-file-name "inits/indent-guide"))
(load (local-file-name "inits/linum"))
(load (local-file-name "inits/drag-stuff"))
(load (local-file-name "inits/hideshow"))
(load (local-file-name "inits/which-key"))
(load (local-file-name "inits/flycheck"))
(load (local-file-name "inits/yasnippet"))
(load (local-file-name "inits/company"))
(load (local-file-name "inits/projectile"))
(load (local-file-name "inits/magit"))
(load (local-file-name "inits/elisp"))
(load (local-file-name "inits/haskell"))
(load (local-file-name "inits/config"))
(load (local-file-name "inits/undotree"))
(load (local-file-name "inits/neotree"))
(load (local-file-name "inits/rainbow"))
(load (local-file-name "inits/smartparens"))
(load (local-file-name "inits/markdown"))
(load (local-file-name "inits/scala"))
(load (local-file-name "inits/git-gutter"))
(load (local-file-name "inits/docker"))
(load (local-file-name "inits/typescript"))
(load (local-file-name "inits/ranger"))
(load (local-file-name "inits/dashboard"))


;;custom.el bullshit
(setq custom-file (local-file-name "custom.el"))
(load custom-file t)


;;; init.el ends here
