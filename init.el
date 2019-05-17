;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(defvar my-packages '(better-defaults
                      clojure-mode
                      cider
                      company
                      powerline
                      dracula-theme
                      markdown-mode
                      evil
                      paredit
                      rainbow-delimiters))
(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

;; Auto-customizations
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(exec-path
   (quote
    ("/usr/local/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/usr/local/Cellar/emacs/26.1_1/libexec/emacs/26.1/x86_64-apple-darwin15.6.0" "~/dev/bin")))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (magit company better-defaults markdown-mode powerline dracula-theme rainbow-delimiters paredit cider clojure-mode)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#282a36" :foreground "#f8f8f2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight light :height 180 :width normal :foundry "nil" :family "Source Code Pro for Powerline")))))

;; Evil
(require 'evil)
(evil-mode 1)
;; Theme
(load-theme 'dracula t)
;;(load-theme 'atom-dark t)
;;(load-theme 'atom-one-dark t)
;;(require 'airline-themes)
;;(load-theme 'airline-molokai)
;; Powerline
(require 'powerline)
;; Set the powerline separator if the bitmaps are broken,
;; but comment out if it slows down the machine
;; (happens on Windows when fonts are missing or broken)
(setq powerline-default-separator 'utf-8)
(powerline-center-evil-theme)
;; Parens
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'paredit-mode)
(add-hook 'prog-mode-hook #'company-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
;; Neotree
(add-to-list 'load-path "~/.emacs.d/jaypei/emacs-neotree")
(require 'neotree)
(setq neo-window-width 15)
(setq neo-window-fixed-size nil)
(setq neo-theme 'arrow)
(neotree-dir "~/dev/proj")
(neo-buffer--unlock-width)
;; Screen layout
(tool-bar-mode -1)
(menu-bar-mode t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(set-frame-parameter nil 'fullscreen 'fullboth)
(setq visible-bell nil)
(setq ring-bell-function 'ignore)
