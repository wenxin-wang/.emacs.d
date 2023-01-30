;;; -*- lexical-binding: t; -*-

;;; Section: Functions related to Keybindings.

(eval-when-compile
  (require 'general))

;;;###autoload (autoload 'my:space-file-leader-def "lib-keybinding" nil 'macro)
(general-create-definer my:space-file-leader-def
  :prefix-command 'my:space-file-leader-command
  :prefix-map 'my:space-file-leader-map)

;;;###autoload (autoload 'my:space-buffer-leader-def "lib-keybinding")
(general-create-definer my:space-buffer-leader-def
  :prefix-command 'my:space-buffer-leader-command
  :prefix-map 'my:space-buffer-leader-map)

;;;###autoload (autoload 'my:space-exit-leader-def "lib-keybinding")
(general-create-definer my:space-exit-leader-def
  :prefix-command 'my:space-exit-leader-command
  :prefix-map 'my:space-exit-leader-map)

;;;###autoload (autoload 'my:space-vc-leader-def "lib-keybinding")
(general-create-definer my:space-vc-leader-def
  :prefix-command 'my:space-vc-leader-command
  :prefix-map 'my:space-vc-leader-map)

;;;###autoload (autoload 'my:space-zmisc-leader-def "lib-keybinding")
(general-create-definer my:space-zmisc-leader-def
  :prefix-command 'my:space-zmisc-leader-command
  :prefix-map 'my:space-zmisc-leader-map)

;;;###autoload (autoload 'my:space-leader-def "lib-keybinding")
(general-create-definer my:space-leader-def
  :states '(normal visual insert emacs)
  :prefix "SPC"
  :non-normal-prefix "M-SPC"
  :prefix-map 'my:space-leader-map)

(provide 'lib-keybinding)