;;load misc
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

;;load plugins
;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/") 
("org" . "https://orgmode.org/elpa/") 
("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package) 
(package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package modus-themes)

;;(use-package elisp-format)

(use-package ivy 
:init (ivy-mode 1)
:diminish 
:bind (("C-s" . swiper) :map ivy-minibuffer-map ("TAB" . ivy-alt-done) 
("C-l" . ivy-alt-done) 
("C-j" . ivy-next-line) 
("C-k" . ivy-previous-line) 
:map ivy-switch-buffer-map ("C-k" . ivy-previous-line) 
("C-l" . ivy-done) 
("C-d" . ivy-switch-buffer-kill) 
:map ivy-reverse-i-search-map ("C-k" . ivy-previous-line) 
("C-d" . ivy-reverse-i-search-kill)))

(use-package which-key 
:init (which-key-mode) 
:diminish which-key-mode 
:config (setq which-key-idle-delay 0.3))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-vivendi-deuteranopia))
 '(custom-safe-themes
   '("1d6b446390c172036395b3b87b75321cc6af7723c7545b28379b46cc1ae0af9e" default))
 '(package-selected-packages '(elisp-format which-key ivy modus-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
