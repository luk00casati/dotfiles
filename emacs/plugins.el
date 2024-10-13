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

(use-package elisp-format)

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

