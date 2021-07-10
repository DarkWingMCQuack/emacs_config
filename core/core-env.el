;;; core-env.el ---


;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 300000000)

(setq read-process-output-max (* 3 1024 1024)) ;; 3mb
(setq help-window-select t)

;; ensure environment variables inside Emacs look the same as in the user's shell.
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)
