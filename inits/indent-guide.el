
(use-package highlight-indent-guides
  :config
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-character ?\┆)

  (setq highlight-indent-guides-auto-enabled nil)
  (set-face-background 'highlight-indent-guides-odd-face "orange")
  (set-face-background 'highlight-indent-guides-even-face "orange")
  (set-face-foreground 'highlight-indent-guides-character-face "orange")

  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode))
