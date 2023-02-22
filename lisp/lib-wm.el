;;; -*- lexical-binding: t; -*-

;;; Section: Functions related to windows managing.

;;;###autoload
(defun exwm-all-buffers ()
  (seq-filter
   (lambda (buffer)
     (eq 'exwm-mode (buffer-local-value 'major-mode buffer)))
   (buffer-list)))

;;;###autoload
(defun consult-buffer-state-filter ()
  "Buffer state function that doesn't preview X/Tramp buffers."
  (let ((orig-state (consult--buffer-state))
        (filter (lambda (action cand)
                  (if (and cand
                           (or (eq action 'return)
                               (let ((buffer (get-buffer cand)))
                                 (and buffer
                                      (not (eq 'exwm-mode (buffer-local-value 'major-mode buffer)))
                                      (not (file-remote-p (buffer-local-value 'default-directory buffer)))))))
                      cand
                    nil))))
    (lambda (action cand)
      (funcall orig-state action (funcall filter action cand)))))

(provide 'lib-wm)