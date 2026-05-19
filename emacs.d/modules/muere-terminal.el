;;; muere-terminal.el --- terminal -*- lexical-binding: t; -*-

(defun mu/term-here ()
  "Abrir terminal en el directorio actual."
  (interactive)
  (let ((default-directory default-directory))
    (eat)))

(use-package eat
  :hook
  (eshell-mode . eat-eshell-mode)
  :config
  (setq eat-kill-buffer-on-exit t)
  (evil-set-initial-state 'eat-mode 'insert)
  (evil-define-key 'normal eat-mode-map
    (kbd "p") (lambda () (interactive)
                (eat-self-input 1 (current-kill 0))
                (evil-insert-state))))

(provide 'muere-terminal)
;;; muere-terminal.el ends here
