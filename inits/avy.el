(use-package avy
  :custom
  (avy-background t)
  (avy-all-windows t)

  :general
  (my-leader 
	"j" '(avy-goto-line :wk "avy line jump")
	"a" '(avy-goto-char-timer :wk "goto char")))
