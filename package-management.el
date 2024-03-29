;;; package-management --- emacs package-management components initialization

;;; Commentary:
;;; Initialization for:
;;; 1. straight.el
;;; 2. use-package


;;; Code:

;;; 1. Bootstrap straight.el
;;; 2. use-package
;;; 3. el-patch

(setq straight-vc-git-default-clone-depth 1)

(let ((bootstrap-file
        (expand-file-name
          "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
    (unless (file-exists-p bootstrap-file)
      (with-current-buffer
        (url-retrieve-synchronously
          "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
          nil 'inhibit-cookies)
        (goto-char (point-max))
        (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;; Done bootstrapping straight.el

;;; 2. Setup use-package
(setq straight-use-package-by-default t)
(straight-use-package 'use-package)
(straight-use-package 'diminish)

;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                          ;; ("marmalade" . "https://marmalade-repo.org/packages/")
;;                          ("melpa" . "http://melpa.org/packages/")))

;;; Done setup use-package

;;; 3. Setup el-patch
(use-package el-patch)

;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                          ;; ("marmalade" . "https://marmalade-repo.org/packages/")
;;                          ("melpa" . "http://melpa.org/packages/")))

;;; 4. setup no-littering as early as possible
;; https://github.com/emacscollective/no-littering
(use-package no-littering)

;;; Done setup use-package

;;; package-management.el ends here
