;; Melpa, Melpa-Stable, masmalade
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
  '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))

(add-to-list 'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

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

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit

    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode

    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking

    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    cider

    ;; allow ido usage in as many contexts as possible. see
    ;; customizations/navigation.el line 23 for a description
    ;; of ido
    ido-ubiquitous

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; project navigation
    projectile

    ;; colorful parenthesis matching
    rainbow-delimiters

    ;; edit html tags like sexps
    tagedit

    ;; git integration
    magit))
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
(add-to-list 'load-path "~/.emacs.d/vendor")


;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
;;(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")

;; Langauage-specific
(load "setup-clojure.el")
(load "setup-js.el")

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
