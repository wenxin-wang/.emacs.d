;;; work

;;; Commentary:

;;; Code:

(use-package miyuki
  :straight (miyuki
              :local-repo "miyuki"
              :repo "https://github.com/wenxin-wang/miyuki"
              :files ("miyuki.el")))

(use-package org-miyuki
  :straight (org-miyuki
              :local-repo "miyuki"
              :repo "https://github.com/wenxin-wang/miyuki"
              :files ("org-miyuki.el"))
  :functions (org-miyuki/ivy-list-keywords org-miyuki/insert-header org-miyuki/org-link-init)
  :config
  (with-eval-after-load 'org
    (org-miyuki/org-link-init))
  (evil-leader/set-key
    "wh" #'org-miyuki/insert-header
    "wK" #'org-miyuki/ivy-list-keywords))

(use-package counsel-miyuki
  :straight (counsel-miyuki
              :local-repo "miyuki"
              :repo "https://github.com/wenxin-wang/miyuki"
              :files ("counsel-miyuki.el"))
  :functions (counsel-miyuki/ag counsel-miyuki/find-file counsel-miyuki/find-all-file)
  :config
  (evil-leader/set-key
    "ws" #'counsel-miyuki/ag
    "wf" #'counsel-miyuki/find-file
    "wF" #'counsel-miyuki/find-all-file))

;; (use-package mu4e
;;   :straight nil
;;   :load-path "/usr/share/emacs/site-lisp/mu4e"
;;   :init
;;   (setq mu4e-maildir       "~/Maildir"   ;; top-level Maildir
;; 	mu4e-sent-folder   "/fastmail/Sent"       ;; folder for sent messages
;; 	mu4e-drafts-folder "/fastmail/Drafts"     ;; unfinished messages
;; 	mu4e-trash-folder  "/fastmail/Trash"      ;; trashed messages
;; 	mu4e-refile-folder "/fastmail/Archive"
;; 	mu4e-maildir-shortcuts '(("/fastmail/INBOX" . ?i)
;; 				 ("/fastmail/Archive" . ?a)
;; 				 ("/fastmail/Today" . ?t)
;; 				 ("/fastmail/Tomorrow" . ?T)
;; 				 ("/fastmail/ThisWeek" . ?w)
;; 				 ("/fastmail/NextWeek" . ?W)
;; 				 ("/fastmail/ThisMonth" . ?m)
;; 				 ("/fastmail/NextMonth" . ?M)
;; 				 ("/fastmail/SomeDay" . ?s)
;; 				 ("/fastmail/Feeds" . ?f))
;; 	mu4e-get-mail-command "mbsync -V fastmail-inbox"
;; 	mu4e-update-interval 600
;; 	mu4e-compose-in-new-frame t
;; 	message-send-mail-function 'message-send-mail-with-sendmail
;; 	sendmail-program "/usr/bin/msmtp")
;;   :config
;;   (add-to-list 'mu4e-bookmarks
;; 	       '("maildir:/fastmail/Sent and from:i@wenxinwang.me and to:/i\+.*@wenxinwang\.me/" "should sent by paul" ?Z))
;;   (defun mu4e-headers-mark-all (MARKPAIR)
;;     "Put a ! \(read) mark on all visible unread messages"
;;     (mu4e-headers-mark-for-each-if
;;      MARKPAIR
;;      (lambda (msg param) t)))
;;   (defun mu4e-headers-mark-all-delete ()
;;     "Put a ! \(read) mark on all visible unread messages"
;;     (interactive)
;;     (mu4e-headers-mark-all '(delete)))
;;   (evil-leader/set-key
;;     "uu" #'mu4e
;;     "uD" #'mu4e-headers-mark-all-delete))
;;
;; (use-package mu4e-alert
;;   :after mu4e
;;   :init
;;   (with-eval-after-load 'org
;;     (use-package org-mu4e
;;       :straight nil))
;;   (setq mu4e-alert-interesting-mail-query
;;      "flag:unread maildir:/fastmail/INBOX")
;;   (mu4e-alert-set-default-style 'libnotify)
;;   (add-hook 'after-init-hook #'mu4e-alert-enable-notifications)
;;   (add-hook 'after-init-hook #'mu4e-alert-enable-mode-line-display))

(use-package zotxt
  :config
  (add-hook 'org-mode-hook 'org-zotxt-mode))

(use-package deft
  :config
  (setq
    deft-directory my:scratchdir
    deft-recursive t)
  (evil-define-key 'normal deft-mode-map
    "q" #'kill-buffer)
  (evil-leader/set-key
    "cf" #'deft))

;;; work.el ends here
