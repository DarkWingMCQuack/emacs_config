(use-package centaur-tabs
  :config
  (centaur-tabs-mode t)
  (centaur-tabs-headline-match)

  ;; wtf why dies this not work?
  ;; :general
  (general-define-key
   :states 'normal
   "L" '(centaur-tabs-forward :wk "tab right")
   "H" '(centaur-tabs-backward :wk "tab left"))

  :custom
  (centaur-tabs-style "rounded")
  (centaur-tabs-set-icons t)
  (centaur-tabs-set-bar 'under)
  ;; Note: If you're not using Spacmeacs, in order for the underline to display
  ;; correctly you must add the following line:
  (x-underline-at-descent-line t)
  (centaur-tabs-cycle-scope 'tabs))
