;;; init --- emacs initialization

;;; Commentary:
;;; Initialization

;;; Code:
(message "Initializing emacs: %s" user-init-file)

(defun my:fullpath-current-file ()
  (file-name-directory (or load-file-name buffer-file-name)))

(defun xah:fullpath-relative-to-current-file (@file-relative-path)
  "Return the full path of *file-relative-path, relative to caller's file location.
See http://ergoemacs.org/emacs/organize_your_dot_emacs.html"
  (concat (my:fullpath-current-file) @file-relative-path))

(defun my:load-config (@file-relative-path)
  (load (concat user-emacs-directory @file-relative-path)))

;; I know, I know. I'd like to have emacs accept custom files
;; under different path than "~/.emacs.d"
(setq user-emacs-directory (my:fullpath-current-file))

(my:load-config "core")
;; load org-mode settings as early as possible
;; see link in org.el
(my:load-config "org-straight")
(my:load-config "lang")

;;; init.el ends here
