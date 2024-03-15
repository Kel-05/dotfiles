;; require packages section
  ;; add melpa repository
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)
  ;;

(use-package rust-mode) 
(add-hook 'rust-mode-hook
	  (lambda () (setq indent-tabs-mode nil)))
(add-hook 'rust-mode-hook
	  (lambda () (setq cargo-minor-mode t)))
(add-hook 'rust-mode-hook #'lsp)

(use-package markdown-mode)
(use-package cargo)
(use-package cargo-mode)
(use-package flycheck)

(use-package lsp-ui)
(use-package lsp-mode)
(use-package magit)
(use-package yasnippet)

(use-package company
  :ensure t
  :config
  (add-to-list 'company-backends 'company-capf)
  (global-company-mode))
;;

(setq default-directory "/mnt/HDD/Documents/")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(display-line-numbers t)
 '(electric-pair-mode t)
 '(make-backup-files nil)
 '(package-selected-packages
   '(yasnippet-snippets yasnippet magit cargo cargo-mode company flycheck lsp-ui lsp-mode markdown-mode catppuccin-theme rust-mode))
 '(require-final-newline t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Catppuccin theme
(load-theme 'catppuccin :no-confirm)
(setq catppuccin-flavor 'macchiato) ;; or 'latte, 'macchiato, or 'mocha
(catppuccin-reload)
(set-face-attribute 'default nil :height 90)
;;

;; wlclipboard - by yorickvP on Github
(setq wl-copy-process nil)
  (defun wl-copy (text)
    (setq wl-copy-process (make-process :name "wl-copy"
                                        :buffer nil
                                        :command '("wl-copy" "-f" "-n")
                                        :connection-type 'pipe))
    (process-send-string wl-copy-process text)
    (process-send-eof wl-copy-process))
  (defun wl-paste ()
    (if (and wl-copy-process (process-live-p wl-copy-process))
        nil ; should return nil if we're the current paste owner
        (shell-command-to-string "wl-paste -n | tr -d \r")))
  (setq interprogram-cut-function 'wl-copy)
  (setq interprogram-paste-function 'wl-paste)
;;

;; define keymaps
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "M-RET") yas-maybe-expand)

  ;; keys for navigation
(define-key yas-keymap [(tab)]       nil)
(define-key yas-keymap (kbd "TAB")   nil)
(define-key yas-keymap [(shift tab)] nil)
(define-key yas-keymap [backtab]     nil)
(define-key yas-keymap (kbd "M-RET") 'yas-next-field-or-maybe-expand)
(define-key yas-keymap (kbd "C-M-<return>") 'yas-prev)
;;
