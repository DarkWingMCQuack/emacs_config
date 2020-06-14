(use-package ranger 
  :after evil
  :config
  (setq ranger-cleanup-eagerly t)

  (evil-leader/set-key
    "rr"    'ranger))
