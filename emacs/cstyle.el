(provide 'cstyle)

(defun my-c-mode-common-hook ()
  (c-set-style "k&r")
  (c-set_offset 'member-init-intro '++)
  (setq default-tab-width 2)
  (setq indent-tabs-mode nil)
  (c-toggle-auto-hungry-state 1)
  (font-lock-mode 2)
  (define-key c-mode-base-map "\C-m" 'newline-and-indent))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
