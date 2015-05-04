;; Melpa, Melpa-Stable, masmalade
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
  '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))

(add-to-list 'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Full bell diable
(setq ring-bell-function 'ignore)

;;Auto Fill mode
(add-hook 'text-mode-hook 'auto-fill-mode)

;; Hide menu-bar
(menu-bar-mode -1)

;; Hide scroll
(scroll-bar-mode -1)

;; Hide tool bar
(tool-bar-mode -1)

;; Haskell mode
;; custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(delete-selection-mode t)
 '(ergoemacs-mode t)
 '(haskell-mode-hook (quote (turn-on-haskell-indent turn-on-haskell-doc interactive-haskell-mode)))
 '(org-CUA-compatible nil)
 '(org-replace-disputed-keys nil)
 '(recentf-mode t)
 '(shift-select-mode nil))

;; distinguished theme
;;(load-theme 'distinguished t)

;;moe-theme
(require 'moe-theme)
(moe-dark)

;; In every buffer, the line which contains the cursor will be fully
;; highlighted
(global-hl-line-mode 1)

;; Clojure
;; require or autoload paredit-mode
(add-hook 'clojure-mode-hook 'paredit-mode)

;; require or autoload smartparensq
(add-hook 'clojure-mode-hook 'smartparens-strict-mode)

;; Parenthesis mode
(show-paren-mode 1)

;; Tamaño de letra
(set-face-attribute 'default nil :height 100)

;;Ciao
;;(load "/usr/lib/ciao/ciao-mode-init")

;;lua-mode

(setq ring-bell-function 'ignore)

;;line-number
(line-number-mode 1)

;;Auto Fill mode
(add-hook 'text-mode-hook 'auto-fill-mode)

;; Hide menu-bar
(menu-bar-mode -1)

;; Hide scroll
(scroll-bar-mode -1)

;; Hide tool bar
(tool-bar-mode -1)

;; Haskell mode
;; custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(delete-selection-mode t)
 '(ergoemacs-mode t)
 '(haskell-mode-hook (quote (turn-on-haskell-indent turn-on-haskell-doc interactive-haskell-mode)))
 '(org-CUA-compatible nil)
 '(org-replace-disputed-keys nil)
 '(recentf-mode t)
 '(shift-select-mode nil))

;; distinguished theme
;;(load-theme 'distinguished t)

;;moe-theme
(require 'moe-theme)
(moe-dark)

;; In every buffer, the line which contains the cursor will be fully
;; highlighted
(global-hl-line-mode 1)

;; Clojure
;; require or autoload paredit-mode
(add-hook 'clojure-mode-hook 'paredit-mode)

;; require or autoload smartparensq
(add-hook 'clojure-mode-hook 'smartparens-strict-mode)

;; Parenthesis mode
(show-paren-mode 1)

;; Tamaño de letra
(set-face-attribute 'default nil :height 100)

;;Ciao
;;(load "/usr/lib/ciao/ciao-mode-init")

;;lua-mode

(setq ring-bell-function 'ignore)

;;line-number
(line-number-mode 1)

;;Auto Fill mode
(add-hook 'text-mode-hook 'auto-fill-mode)

;; Hide menu-bar
(menu-bar-mode -1)

;; Hide scroll
(scroll-bar-mode -1)

;; Hide tool bar
(tool-bar-mode -1)

;; Haskell mode
;; custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(delete-selection-mode t)
 '(ergoemacs-mode t)
 '(haskell-mode-hook (quote (turn-on-haskell-indent turn-on-haskell-doc interactive-haskell-mode)))
 '(org-CUA-compatible nil)
 '(org-replace-disputed-keys nil)
 '(recentf-mode t)
 '(shift-select-mode nil))

;; distinguished theme
;;(load-theme 'distinguished t)

;;moe-theme
(require 'moe-theme)
(moe-dark)

;; In every buffer, the line which contains the cursor will be fully
;; highlighted
(global-hl-line-mode 1)

;; Clojure
;; require or autoload paredit-mode
(add-hook 'clojure-mode-hook 'paredit-mode)

;; require or autoload smartparensq
(add-hook 'clojure-mode-hook 'smartparens-strict-mode)

;; Parenthesis mode
(show-paren-mode 1)

;; Tamaño de letra
(set-face-attribute 'default nil :height 100)

;;Ciao
;;(load "/usr/lib/ciao/ciao-mode-init")

;; Lua mode
(autoload 'lua-mode "lua-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-hook 'lua-mode-hook 'turn-on-font-lock)
(setq lua-indent-level 2)
