(use-package lsp-mode
     :commands (lsp-enable-which-key-integration
                lsp-format-buffer
                lsp-organize-imports)
     :diminish
     :hook ((java-mode . lsp)
            (lsp-mode . (lambda ()
                          ;; Integrate `which-key'
                          (lsp-enable-which-key-integration)

                          ;; Format and organize imports
                          ;; (unless (apply #'derived-mode-p centaur-lsp-format-on-save-ignore-modes)
                          ;;   (add-hook 'before-save-hook #'lsp-format-buffer t t)
                          ;;   (add-hook 'before-save-hook #'lsp-organize-imports t t))
                          )))
     :bind (:map lsp-mode-map
            ("C-c C-d" . lsp-describe-thing-at-point)
            ([remap xref-find-definitions] . lsp-find-definition)
            ([remap xref-find-references] . lsp-find-references))
     :init
     ;; @see https://emacs-lsp.github.io/lsp-mode/page/performance
     (setq read-process-output-max (* 1024 1024)) ;; 1MB

     (setq lsp-keymap-prefix "C-c l"
           lsp-keep-workspace-alive nil
           lsp-signature-auto-activate nil
           lsp-modeline-code-actions-enable nil
           lsp-modeline-diagnostics-enable nil

           lsp-enable-file-watchers nil
           lsp-enable-folding nil
           lsp-enable-semantic-highlighting nil
           lsp-enable-symbol-highlighting nil
           lsp-enable-text-document-color nil

           lsp-enable-indentation nil
           lsp-enable-on-type-formatting nil)

     ;; For `lsp-clients'
     (setq lsp-clients-python-library-directories '("/usr/local/" "/usr/"))
     (when (executable-find "rust-analyzer")
       (setq lsp-rust-server 'rust-analyzer))
     :config
     (with-no-warnings
       (defun my-lsp--init-if-visible (func &rest args)
         "Not enabling lsp in `git-timemachine-mode'."
         (unless (bound-and-true-p git-timemachine-mode)
           (apply func args)))
       (advice-add #'lsp--init-if-visible :around #'my-lsp--init-if-visible))

     (defun lsp-update-server ()
       "Update LSP server."
       (interactive)
       ;; Equals to `C-u M-x lsp-install-server'
       (lsp-install-server t)))


   (use-package lsp-ui
     :custom-face
     (lsp-ui-sideline-code-action ((t (:inherit warning))))
     :bind (("C-c u" . lsp-ui-imenu)
            :map lsp-ui-mode-map
            ("M-<f6>" . lsp-ui-hydra/body)
            ("M-RET" . lsp-ui-sideline-apply-code-actions))
     :hook (lsp-mode . lsp-ui-mode)
     :init (setq lsp-ui-sideline-show-diagnostics nil
                 lsp-ui-sideline-ignore-duplicate t
                 lsp-ui-doc-border (face-foreground 'font-lock-comment-face)
                 lsp-ui-imenu-colors `(,(face-foreground 'font-lock-keyword-face)
                                       ,(face-foreground 'font-lock-string-face)
                                       ,(face-foreground 'font-lock-constant-face)
                                       ,(face-foreground 'font-lock-variable-name-face)))
     :config
     ;; `C-g'to close doc
     (advice-add #'keyboard-quit :before #'lsp-ui-doc-hide)

     ;; Reset `lsp-ui-doc-background' after loading theme
     (add-hook 'after-load-theme-hook
               (lambda ()
                 (setq lsp-ui-doc-border (face-foreground 'font-lock-comment-face))
                 (set-face-background 'lsp-ui-doc-background
                                      (face-background 'tooltip)))))

   ;; Ivy integration
   (use-package lsp-ivy
     :after lsp-mode
     :bind (:map lsp-mode-map
            ([remap xref-find-apropos] . lsp-ivy-workspace-symbol)
            ("C-s-." . lsp-ivy-global-workspace-symbol)))

   ;; Debug
(use-package dap-mode
       :defines dap-python-executable
       :functions dap-hydra/nil
       :diminish
       :bind (:map lsp-mode-map
              ("<f5>" . dap-debug)
              ("M-<f5>" . dap-hydra))
       :hook ((after-init . dap-mode)
              (dap-mode . dap-ui-mode)
              (dap-session-created . (lambda (_args) (dap-hydra)))
              (dap-stopped . (lambda (_args) (dap-hydra)))
              (dap-terminated . (lambda (_args) (dap-hydra/nil)))

              (python-mode . (lambda () (require 'dap-python)))
              (ruby-mode . (lambda () (require 'dap-ruby)))
              (go-mode . (lambda () (require 'dap-go)))
              (java-mode . (lambda () (require 'dap-java)))
              ((c-mode c++-mode objc-mode swift-mode) . (lambda () (require 'dap-lldb)))
              (php-mode . (lambda () (require 'dap-php)))
              (elixir-mode . (lambda () (require 'dap-elixir)))
              ((js-mode js2-mode) . (lambda () (require 'dap-chrome)))
              (powershell-mode . (lambda () (require 'dap-pwsh))))
       :init
       (setq dap-auto-configure-features '(sessions locals breakpoints expressions controls))
       (when (executable-find "python3")
         (setq dap-python-executable "python3")))
(use-package lsp-java
       :config (setq lsp-java-jdt-download-url "https://download.eclipse.org/jdtls/milestones/0.57.0/jdt-language-server-0.57.0-202006172108.tar.gz")
       :hook (java-mode . (lambda () (require 'lsp-java))))


(provide 'ora-lsp)
