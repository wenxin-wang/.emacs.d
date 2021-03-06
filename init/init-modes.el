;;; init-modes  --- initialize modes

;;; Commentary:
;;; All global modes goes here

;;; Code:

;; Clipboard
(setq x-select-enable-clipboard nil)

;; Fill
(setq-default fill-column 72)
(setq-default indent-tabs-mode nil)

;; Python
(add-hook
 'python-mode-hook
 (lambda ()
   (progn
     (add-hook 'hack-local-variables-hook
               (lambda ()
                 (when (boundp 'project-venv-name)
                   (venv-workon project-venv-name))))
     (add-to-list
      (make-local-variable 'company-backends)
      'company-jedi)
     (setq fill-column 79)
     )))

;; JS
(setq js-indent-level 2)
(setq inferior-js-program-command "node --interactive")
(setenv "NODE_NO_READLINE" "1")
(add-hook
 'js-mode-hook
 (lambda ()
   (progn
     (tern-mode t))))

;; CoffeeScript Mode
(custom-set-variables '(coffee-tab-width 2))

;; ApiarY
(add-to-list 'auto-mode-alist '("\\.apib$" . markdown-mode))

;; Markdown
(add-hook 'markdown-mode-hook 'outline-evil-keys)

;; Outline
(defun outline-evil-keys()
  (progn
    (define-key evil-normal-state-map (kbd "C-n") 'outline-next-visible-heading)
    (define-key evil-normal-state-map (kbd "C-p") 'outline-previous-visible-heading)
    (define-key evil-normal-state-map (kbd "C-f") 'outline-forward-same-level)
    (define-key evil-normal-state-map (kbd "C-b") 'outline-backward-same-level)
    (define-key evil-normal-state-map (kbd "C-u") 'outline-up-heading)))

;; Completion
(global-company-mode)
(add-to-list 'company-backends 'company-tern)
(custom-set-variables
 '(company-dabbrev-downcase nil)
 '(company-dabbrev-ignore-case nil))

;; Flycheck
(global-flycheck-mode)

;; Helm
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(helm-mode 1)
(helm-autoresize-mode 1)

;; Projectile
(setq projectile-keymap-prefix (kbd "C-p"))
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;; Parens
(show-paren-mode 1)
(setq show-paren-delay 0)
(electric-pair-mode)

;; Line number
(global-linum-mode t)

;; Git Rebase
(add-hook
 'git-rebase-mode-hook
 (lambda ()
   (progn
     (message "FFFFFFFFFF!")
     (evil-mode 0))))

;; Org mode
(eval-after-load "org" '(setcdr (assoc "\\.pdf\\'" org-file-apps) "pupdf %s"))

;; Web mode
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-hook
 'web-mode-hook
 (lambda ()
   (setq web-mode-markup-indent-offset 2)
   (setq web-mode-css-indent-offset 2)
   (setq web-mode-code-indent-offset 2)
   ))
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; Salt
(add-to-list 'auto-mode-alist '("\\.sls\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("/Saltfile\\'" . yaml-mode))

;; Org Mode
(custom-set-variables '(org-startup-truncated nil))

(provide 'init-modes)

;;; init-modes.el ends here
