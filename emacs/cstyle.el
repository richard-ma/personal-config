(provide 'cstyle)

;; cc-mode
(add-to-list 'load-path "~/.emacs.d/plugins/cc-mode")
(require 'cc-mode)
(setq c-basic-offset 4) ;; 默认缩进为4
(setq c-default-style '((c-mode . "k&r")    ;; c代码使用k&r格式
                        (awk-mode . "awk")  ;; awk代码使用awk格式
                        (other . "linux"))) ;; 其他使用linux kernel格式
(setq-default c-electric-flag nil) ;; 关闭根据;和}刷新缩进的功能，新手建议关闭
(defun my-make-CR-do-indent () ;; RET后自动计算缩进
       (define-key c-mode-base-map "\C-m" 'c-context-line-break))
(add-hook 'c-initialization-hook 'my-make-CR-do-indent)
