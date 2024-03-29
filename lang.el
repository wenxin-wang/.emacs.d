;;; lang --- emacs lang components initialization

;;; Commentary:

;;; Code:

;;; Smart parens

(use-package smartparens
  :config
  (require 'smartparens-config)
  (smartparens-global-mode t)
  :diminish smartparens-mode)

;;; Editor Config

;; I think editor config just change some basic indent settings
;; It doesn't change indent logic
(use-package editorconfig
  :diminish editorconfig-mode
  :config
  (editorconfig-mode 1))

;;; - General packages

;; Clang-format

(use-package clang-format)

(use-package google-c-style
  :straight (google-c-style :fetcher github :repo "google/styleguide" :branch "gh-pages")
  :demand t
  :config (c-add-style "Google" google-c-style))

;; Flycheck
(use-package flycheck
  :init
  (add-hook 'sh-mode-hook 'flycheck-mode)
  :config
  ;; for ccls
  ;; (setq-default
  ;;  flycheck-disabled-checkers
  ;;  '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  (evil-leader/set-key
    "el" #'flycheck-list-errors
    "en" #'next-error
    "ep" #'previous-error))
;; (global-flycheck-mode)) It's annoyting sometimes

;; Flymake
(use-package flymake
  :config
  (evil-leader/set-key
    "el" #'flymake-show-diagnostic
    "en" #'flymake-goto-next-error
    "ep" #'flymake-goto-prev-error
    "ed" #'flymake-goto-diagnostic))

;;; Company
(use-package company
  :diminish company-mode
  :config
  (global-company-mode 1))

;;; Yasnippet

(use-package yasnippet-snippets)
(use-package yasnippet
  :diminish yas-minor-mode
  :config
  (yas-global-mode 1))

;;; lsp-mode
;; (use-package lsp-mode
;;   :commands lsp
;;   :init
;;   (setq
;;     lsp-modeline-code-actions-mode t
;;     lsp-clients-clangd-args '("-log=verbose")
;;     lsp-prefer-flymake nil)
;;   :config
;;   (evil-leader/set-key
;;     "ga" #'lsp-execute-code-action
;;     "gD" #'lsp-find-definition
;;     "gR" #'lsp-find-references))
    ;; "gc" #'ccls-call-hierarchy
    ;; "gm" #'ccls-member-hierarchy

;; (use-package lsp-ui
;;   ;; :hook lsp-mode seems to add a hook called lsp-ui, not lsp-ui-mode
;;   :commands lsp-ui-mode
;;   :init
;;   (add-hook 'lsp-mode-hook #'lsp-ui-mode)
;;   (setq
;;     lsp-ui-doc-enable nil
;;     lsp-ui-sideline-show-hover nil)
;;     ;; lsp-ui-peek-always-show t
;;     ;; lsp-print-io t ; for debug
;;     ;; lsp-ui-sideline-show-symbol t
;;   ;; (load-theme 'doom-solarized-light t)
;;   ;; (spaceline-compile)))
;;   (defun my:lsp-ui-refresh (&optional frame)
;;     "Refresh frame settings for lsp."
;;     (interactive)
;;     (with-selected-frame (or frame (selected-frame))
;;       (if (display-graphic-p)
;;         (if (>= (breeze--get-display-dpi) 109)
;;           (setq lsp-ui-doc-max-width 100)
;;           (setq lsp-ui-doc-max-width 50)))))
;;   (add-hook 'after-make-frame-functions #'my:lsp-ui-refresh)
;;   (add-hook 'window-size-change-functions #'my:lsp-ui-refresh)
;;   ;; lsp-ui-doc-include-signature t
;;   ;; lsp-ui-sideline-enable nil)
;;   :config
;;   (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
;;   (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
;;   (evil-leader/set-key
;;     "gd" #'lsp-ui-peek-find-definitions
;;     "gr" #'lsp-ui-peek-find-references
;;     "th" #'lsp-ui-sideline-toggle-symbols-info
;;     "td" #'lsp-ui-doc-mode))
;;
;; (use-package dap-mode
;;   :straight (dap-mode :type git :repo "https://github.com/yyoncho/dap-mode"
;; 		      :fork (:repo "git@github.com:wenxin-wang/dap-mode"))
;;   :commands (dap-mode dap-ui-mode)
;;   :init
;;   (defun my:dap-mode ()
;;     (dap-mode 1)
;;     (dap-ui-mode 1)))
;;
;; ;;; company
;; (use-package company-lsp
;;   :requires company
;;   :config
;;   (push 'company-lsp company-backends))

(electric-indent-mode -1)
(add-hook 'after-change-major-mode-hook (lambda() (electric-indent-mode -1)))

(use-package ivy-xref
  :init (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))

;;; - C

;; ;; ccls
;; (use-package ccls
;;   :defer t)

(defvar-local my:c-common-use-clang-format t
  "use clang-format for regiion indent, default to t")

(defun my:c-common-hook ()
  ;; (require 'ccls)
  (setq electric-indent-mode -1)
  ;; (lsp)
  ;; (flycheck-mode)
  ;; (flymake-mode)
  ;; (require 'dap-lldb)
  ;; (my:dap-mode)
  ;; (ccls-code-lens-mode)
  (when my:c-common-use-clang-format
    (make-local-variable 'indent-region-function)
    (setq indent-region-function #'clang-format-region)))

;; (defun my:ccls-tree-mode-hook ()
;;   (turn-off-evil-mode))
;;
(add-hook 'c-mode-common-hook #'my:c-common-hook)
;; (add-hook 'ccls-tree-mode-hook #'my:ccls-tree-mode-hook)

;;; - Python

;; (use-package lsp-python-ms
;;   :straight (lsp-python-ms :type git :host github :repo "andrew-christianson/lsp-python-ms")
;;   :config
;;   (setq lsp-python-ms-dir "/usr/lib/microsoft-python-language-server/"
;; 	lsp-python-ms-executable "/usr/bin/mspyls"))

(defun my:python-hook ()
  ;; (lsp)
  ;; (flycheck-mode)
  ;; (flymake-mode)
  ;; (require 'dap-python)
  ;; (my:dap-mode)
  )

(add-hook 'python-mode-hook #'my:python-hook)

;;; - Elisp setup

;; https://emacsredux.com/blog/2013/06/25/boost-performance-by-leveraging-byte-compilation/
(defun er:remove-elc-on-save ()
  "If you're saving an Emacs Lisp file, likely the .elc is no longer valid."
  (add-hook
    'after-save-hook
    #'(lambda ()
        (if (file-exists-p (concat buffer-file-name "c"))
          (delete-file (concat buffer-file-name "c"))))
    nil
    t))

(defun my:elisp-mode-hook ()
  (er:remove-elc-on-save))

(add-hook 'emacs-lisp-mode-hook #'my:elisp-mode-hook)

(use-package eldoc
  :defer t
  :diminish eldoc-mode)

;;; Rust

(defun my:rust-mode-hook ()
  ;; (lsp)
  )

(use-package rust-mode
  :mode "\\.rs\\'"
  :init
  (add-hook 'rust-mode-hook #'my:rust-mode-hook))

;;; Tex

(use-package tex
  :straight auctex
  :init
  (setq ; TeX-command-default latex-build-command
    TeX-auto-save t
    TeX-parse-self t
    TeX-syntactic-comment t
    ;; Synctex support
    TeX-source-correlate-start-server nil
    ;; Don't insert line-break at inline math
    LaTeX-fill-break-at-separators nil))

;;; Java

(defun my:java-mode-hook ()
  ;; (require 'dap-java)
  ;; (require 'lsp-java)
  ;; (lsp)
  ;; (require 'dap-java)
  )

;; (use-package lsp-java
;;   :init
;;   (add-hook 'java-mode-hook #'my:java-mode-hook))

;;; - Haskell setup

(use-package haskell-mode
  :defer
  :config
  ;; (setq-default haskell-tags-on-save nil
  ;; 		haskell-process-suggest-remove-import-lines t
  ;; 		haskell-process-auto-import-loaded-modules t
  ;; 		haskell-process-type 'stack-ghci)
  ;; (define-key haskell-mode-map [f8] 'haskell-navigate-imports)
  ;; (add-hook 'haskell-mode-hook 'haskell-doc-mode)
  )

;;; PEG

(use-package peg-mode
  :straight nil
  :load-path "third-party/peg-mode.el/"
  :mode ("\\.peg\\'" . peg-mode))

;;; GNUPlot
(use-package gnuplot-mode
  :mode ("\\.gp\\'" "\\.gnuplot\\'"))

;;; Golang
(defun my:go-mode-hook ()
  ;; (lsp)
  )

(use-package go-mode
  :init
  (add-hook 'go-mode-hook #'my:go-mode-hook)
  :mode "\\.go\\'")

;;; Dart
(defun my:dart-mode-hook ()
  ;; (lsp)
  )

(use-package dart-mode
  :init
  (add-hook 'dart-mode-hook #'my:dart-mode-hook)
  :mode "\\.dart\\'")

;;; lua
(use-package lua-mode)

;;; reasonml
(use-package reason-mode)

;;; bazel
(use-package bazel
  ;; https://github.com/bazelbuild/emacs-bazel-mode/issues/122
  :straight (bazel :type git :host github :repo "bazelbuild/emacs-bazel-mode")
  :custom (bazel-mode-buildifier-before-save t))

;;; jsonnet
(use-package jsonnet-mode)

(use-package dockerfile-mode)

;;; lang.el ends here
