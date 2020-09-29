(require 'package) ;; Emacs builtin

;; set package.el repositories
(setq package-archives
      '(
        ("org" . "https://orgmode.org/elpa/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ))

(package-initialize)

(unless (package-installed-p 'use-package)
  ;; only fetch the archives if you don't have use-package installed
  (package-refresh-contents)
  (package-install 'use-package))
;; update packages list if we are on a new install
;; a list of pkgs to programmatically install
;; ensure installed via package.el
(setq my-package-list '(use-package
                           exec-path-from-shell))

;; programmatically install/ensure installed
;; pkgs in your personal list
(dolist (package my-package-list)
  (unless (package-installed-p package)
    (package-install package)))


(setq use-package-always-ensure t)

(use-package auto-package-update
  :custom
  (auto-package-update-delete-old-versions t)
  (auto-package-update-interval 4)
  :config
  (auto-package-update-maybe))
