;; (require 'package) ;; Emacs builtin

;; ;; set package.el repositories
;; (setq package-archives
;;       '(
;;         ("org" . "https://orgmode.org/elpa/")
;;         ("gnu" . "https://elpa.gnu.org/packages/")
;;         ("melpa" . "https://melpa.org/packages/")
;;         ;; ("marmalade" . "http://marmalade-repo.org/packages/")
;;         ))

;; (package-initialize)

;; (unless (package-installed-p 'use-package)
;;   ;; only fetch the archives if you don't have use-package installed
;;   (package-refresh-contents)
;;   (package-install 'use-package))
;; ;; update packages list if we are on a new install
;; ;; a list of pkgs to programmatically install
;; ;; ensure installed via package.el
;; (setq my-package-list '(use-package
;;                          exec-path-from-shell))

;; ;; programmatically install/ensure installed
;; ;; pkgs in your personal list
;; (dolist (package my-package-list)
;;   (unless (package-installed-p package)
;;     (package-install package)))


;; (setq use-package-always-ensure t)

;; (setq load-prefer-newer t)

;;(setq-default straight-cache-autoloads t
;;              straight-fix-org t
;;              straight-fix-flycheck t
;;              straight-recipe-overrides nil
;;              straight-repository-branch "develop"
;;              straight-use-package-by-default t
;;              straight-check-for-modifications '(check-on-save find-when-checking)
;;              straight-vc-git-default-clone-depth 1
;;              straight-check-for-modifications '(check-on-save find-when-checking))


(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(use-package git)
(use-package exec-path-from-shell)
