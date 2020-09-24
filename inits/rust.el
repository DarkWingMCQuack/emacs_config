(use-package toml-mode)
(use-package rust-mode)

;; Add keybindings for interacting with Cargo
(use-package cargo
  :hook (rust-mode . cargo-minor-mode))
