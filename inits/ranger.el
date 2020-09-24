(use-package ranger 
  :after evil
  :config
  (setq ranger-cleanup-eagerly t)

  :general
  (my-leader
   "r r" '(ranger :wk "ranger")))
