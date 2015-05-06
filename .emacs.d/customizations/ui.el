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

;; distinguished theme
;;(load-theme 'distinguished t)

;;moe-theme
(require 'moe-theme)
(moe-dark)

;; Tamaño de letra
(set-face-attribute 'default nil :height 100)

;; In every buffer, the line which contains the cursor will be fully
;; highlighted
(global-hl-line-mode 1)

;; Parenthesis mode
(show-paren-mode 1)
