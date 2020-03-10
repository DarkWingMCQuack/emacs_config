(use-package lsp-mode
  :custom
  (lsp-print-io nil)
  (lsp-trace nil)
  (lsp-print-performance nil)
  (lsp-auto-guess-root t)
  :hook
  (go-mode . lsp)
  (python-mode . lsp)
  (c++-mode . lsp)
  (c-mode . lsp)
  (scala-mode . lsp)
  (lsp-mode . lsp-lens-mode)
  :config
  ;; (require 'lsp-clients)
  (evil-leader/set-key
    ;;paddys extra ehrenfunktion die
    ;;IN KEINEN EINZIGEN FICK LSP BEI MIR FUNKTIONIERT
    "gd"    'lsp-find-definition)

  (setq lsp-clients-clangd-args
        '("-j=4"
          "--background-index"
          "-log=error"
          "--completion-style=detailed"
          "--header-insertion=never"
          "--clang-tidy")))


(use-package company-lsp
  :after company lsp-mode
  :custom
  (company-lsp-cache-candidates t) ;; auto, t(always using a cache), or nil
  (company-lsp-async t)
  (company-lsp-enable-snippet t)
  (company-lsp-enable-recompletion t))

(use-package lsp-treemacs
  :after treemacs lsp-mode
  :commands lsp-treemacs-errors-list)

(use-package lsp-ui
  :after lsp-mode
  :custom
  (lsp-ui-doc-enable nil)
  (lsp-ui-doc-header t)
  (lsp-ui-doc-include-signature nil)
  (lsp-ui-doc-position 'at-point) ;; top, bottom, or at-point
  (lsp-ui-doc-max-width 120)
  (lsp-ui-doc-max-height 30)
  (lsp-ui-doc-use-childframe t)
  (lsp-ui-doc-use-webkit t)
  ;; lsp-ui-flycheck
  (lsp-ui-flycheck-enable t)
  ;; lsp-ui-sideline
  (lsp-ui-sideline-enable nil)
  (lsp-ui-sideline-ignore-duplicate t)
  (lsp-ui-sideline-show-symbol t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-sideline-show-diagnostics nil)
  (lsp-ui-sideline-show-code-actions t)
  (lsp-ui-peek-enable t)
  (lsp-ui-peek-peek-height 20)
  (lsp-ui-peek-list-width 50)
  (lsp-ui-peek-fontify 'on-demand) ;; never, on-demand, or always
  :hook (lsp-mode . lsp-ui-mode))

(use-package dap-mode
  :config
  (dap-mode 1)
  (require 'dap-hydra)
  (require 'dap-gdb-lldb)   ; download and expand lldb-vscode to the =~/.extensions/webfreak.debug=
  (require 'dap-go)     ; download and expand vscode-go-extenstion to the =~/.extensions/go=
  (require 'dap-python)
  (use-package dap-ui
    :ensure nil
    :config
    (dap-ui-mode 1)))

