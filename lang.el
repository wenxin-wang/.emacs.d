;;; lang --- emacs lang components initialization

;;; Commentary:

;;; Code:

;;; Editor Config

;; I think editor config just change some basic indent settings
;; It doesn't change indent logic
(use-package editorconfig
  :config
  (editorconfig-mode 1))

;;; - General packages

;; Clang-format

(use-package clang-format
  :commands clang-format-region)

;; Flycheck
(use-package flycheck
  :init
  (add-hook 'sh-mode-hook 'flycheck-mode)
  :config
  ;; for ccls
  (setq-default
   flycheck-disabled-checkers
   '(c/c++-clang c/c++-cppcheck c/c++-gcc)))
  ;; (global-flycheck-mode)) It's annoyting sometimes

;;; Company
(use-package company
  :config
  (global-company-mode 1))

;;; Yasnippet

(use-package yasnippet-snippets)
(use-package yasnippet
  :config
  (yas-global-mode 1))

;;; lsp-mode
(use-package lsp-mode
  :commands lsp
  :init
  (setq lsp-auto-configure nil
	lsp-prefer-flymake nil
	lsp-session-file (expand-file-name ".lsp-session-v1" my:cache-dir)))

(use-package lsp-ui
  ;; :hook lsp-mode seems to add a hook called lsp-ui, not lsp-ui-mode
  :commands lsp-ui-mode
  :init
  (add-hook 'lsp-mode-hook #'lsp-ui-mode))

;;; company
(use-package company-lsp
  :requires company
  :config
  (push 'company-lsp company-backends))

;;; - C

;; ccls
(use-package ccls
  :defer t)

(defvar-local my:c-common-use-clang-format t
  "use clang-format for regiion indent, default to t")

(defun my:c-common-hook ()
  (require 'ccls)
  (lsp)
  (flycheck-mode)
  (when my:c-common-use-clang-format
    (make-local-variable 'indent-region-function)
    (setq indent-region-function #'clang-format-region)))

(add-hook 'c-mode-common-hook #'my:c-common-hook)

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

;;; lang.el ends here
