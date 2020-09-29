(use-package avy
  :custom
  (avy-background t)
  (avy-all-windows t)

  :general
  (my-leader 
	:states 'normal
	"j" '(avy-goto-line :wk "avy line jump")
	"a" '(avy-goto-char-timer :wk "avy goto char")))
