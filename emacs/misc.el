;; Don't show the splash screen
(setq inhibit-startup-message t)
;;(menu-bar-mode -1)
;;(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq ring-bell-function 'ignore)

;; Display line numbers in every buffer
(global-display-line-numbers-mode 1)
(set-fringe-mode 10)
(desktop-save-mode 1)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;;font
(set-face-attribute 'default nil :font "Mono" :height 125)

;;stop creating files
(setq make-backup-files nil)
(setq auto-save-default nil)

;;cua
(cua-mode t)

;;disable line number for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (dispalay-line-numbers-mode 0))))

;;full screen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(recentf-mode 1)
(setq history-length 25)
(savehist-mode 1)
(save-place-mode 1)
(setq use-dialog-box nil)
(global-auto-revert-mode 1)
(setq gloabal-auto-revert-non-file-buffers t)

;;startup screen
(when (get-buffer "*scratch*")
  (recentf-open-files))
