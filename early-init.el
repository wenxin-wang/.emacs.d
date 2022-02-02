;;; early-init.el --- Emacs 27+ pre-initialisation config

;;; Copied from https://github.com/purcell/emacs.d/blob/master/early-init.el

;;; Commentary:

;; Emacs 27+ loads this file before (normally) calling
;; `package-initialize'.  We use this file to suppress that automatic
;; behaviour so that startup is consistent across Emacs versions.

;;; Code:

(setq package-enable-at-startup nil)
(add-to-list 'default-frame-alist '(tool-bar-lines . 0))
(add-to-list 'default-frame-alist '(menu-bar-lines . 0))
;; (add-to-list 'default-frame-alist '(vertical-scroll-bars))

;; So we can detect this having been loaded
(provide 'early-init)

;;; early-init.el ends here