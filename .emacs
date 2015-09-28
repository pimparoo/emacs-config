;;; .emacs --- my .emacs
;;; commentary:
;;; code:


;; (when (>= emacs-major-version 24)
;;   (require 'package)
;;   (package-initialize)
;;   (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;   (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;;   (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
;;   )
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")    ;; my config files path
(add-to-list 'load-path "~/.emacs.d/lisp/42/") ;; 42 config files path
(add-to-list 'load-path "~/.emacs.d/lisp/themes/")     ;; themes path
(add-to-list 'load-path "~/.emacs.d/lisp/additional/") ;; additional files

;; (benchmark-init/activate)				; uncomment to benchmark emacs startup


;; load config files
(when (>= emacs-major-version 24)
  (load "packages-config.el")				; packages config
)


(load "myfunctions.el")					; my defined function
(load "myconfig.el")					; vanilla config
;; (load "mode-line.el")					; nicer mode-line

;; load 42 files
(load "42config.el")					; C-style indentation
(load "header.el")						; 42 header

;; additional files
;(load "list.el")						; list functions
;(load "string.el")						; string function
;(load "comments.el")					; comments functions

(when (>= emacs-major-version 24)
  (load "monokai-theme.el")				; load monokai theme
)
;; auto-set config variables:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "f782ed87369a7d568cee28d14922aa6d639f49dd676124d817dd82c8208985d0" "3dafeadb813a33031848dfebfa0928e37e7a3c18efefa10f3e9f48d1993598d3" "18a33cdb764e4baf99b23dcd5abdbf1249670d412c6d3a8092ae1a7b211613d5" "90edd91338ebfdfcd52ecd4025f1c7f731aced4c9c49ed28cfbebb3a3654840b" "1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" default)))
 '(enable-recursive-minibuffers nil)
 '(flycheck-clang-args (quote ("-std=c++11")))
 '(flycheck-clang-include-path
   (quote
	("./" "./includes/" "../includes/" "./include/" "../include/" "/nfs/zfs-student-5/users/2014/ntibi/.brew/Cellar/boost/1.58.0/include/" "/data/include/")))
 '(flycheck-clang-language-standard "c++11")
 '(flycheck-cppcheck-include-path (quote ("/data/include/")))
 '(flycheck-gcc-includes nil)
 '(history-delete-duplicates t)
 '(hl-paren-background-colors nil)
 '(hl-paren-delay 0.01)
 '(hl-sexp-background-colors (quote ("color-235")))
 '(initial-buffer-choice nil)
 '(rainbow-identifiers-face-count 15)
 '(safe-local-variable-values
   (quote
	((semantic-add-system-include "/nfs/zfs-student-5/users/2014/ntibi/.brew/include/")
	 (eval when
		   (fboundp
			(quote aggressive-indent-mode))
		   (aggressive-indent-mode -1))
	 (eval when
		   (fboundp
			(quote rainbow-mode))
		   (rainbow-mode 1))
	 (company-clang-arguments "-I/nfs/zfs-student-5/users/2014/ntibi/.brew/Cellar/boost/1.58.0/include/")
	 (company-clang-arguments "-I/nfs/zfs-student-5/users/2014/ntibi/.brew/include/boost"))))
 '(tabbar-separator (quote (0.5)))
 '(vc-annotate-background "#3b3b3b")
 '(vc-annotate-color-map
   (quote
	((20 . "#dd5542")
	 (40 . "#CC5542")
	 (60 . "#fb8512")
	 (80 . "#baba36")
	 (100 . "#bdbc61")
	 (120 . "#7d7c61")
	 (140 . "#6abd50")
	 (160 . "#6aaf50")
	 (180 . "#6aa350")
	 (200 . "#6a9550")
	 (220 . "#6a8550")
	 (240 . "#6a7550")
	 (260 . "#9b55c3")
	 (280 . "#6CA0A3")
	 (300 . "#528fd1")
	 (320f . "#5180b3")
	 (340 . "#6380b3")
	 (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;; Auto set vars :
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-error ((t (:inherit error :underline "red"))))
 '(flycheck-warning ((t (:inherit warning :background "yellow"))))
 '(hi-yellow ((t (:underline t))))
 '(region ((t (:background "color-240"))))
 '(show-paren-match ((t (:background "color-33" :foreground "color-27"))))
 '(show-paren-mismatch ((t (:background "#1B1E1C" :foreground "red" :inverse-video t :weight normal))))
 '(tabbar-button ((t (:inherit tabbar-default :box (:line-width 1 :color "gray20") :underline nil))))
 '(tabbar-button-highlight ((t (:inherit tabbar-default))))
 '(tabbar-default ((t (:inherit variable-pitch :background "gray20" :foreground "gray20" :box (:line-width 1 :color "gray20") :underline nil :height 1))))
 '(tabbar-separator ((t (:inherit tabbar-default :background "gray20")))))

(provide '.emacs)
;;; .emacs ends here
