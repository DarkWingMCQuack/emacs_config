(use-package visual-regexp
  :commands (vr/replace vr/query-replace)
  :general
  (my-leader
	:states 'normal
	"r r" '(vr/replace :wk "regexp replace")))

(use-package visual-regexp-steroids
  :after visual-regexp)
