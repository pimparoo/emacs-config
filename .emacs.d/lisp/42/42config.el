;; 42 C default config


(setq-default font-lock-global-modes nil)
(setq-default tab-width 4)
(setq-default indent-tabs-mode t)
(global-set-key (kbd "DEL") 'backward-delete-char)
(setq-default c-backspace-function 'backward-delete-char)
(setq-default c-basic-offset 4)
(setq-default c-default-style "linux")
(setq-default tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
				64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))

(provide '42config)
;;; 42config.el ends here
