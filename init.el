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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(backward-delete-char-untabify-method 'hungry)
 '(cua-mode t)
 '(cursor-type 'bar)
 '(display-line-numbers t)
 '(electric-pair-mode t)
 '(global-display-line-numbers-mode t)
 '(make-backup-files nil)
 '(markdown-code-lang-modes
   '(("ocaml" . tuareg-mode)
     ("elisp" . emacs-lisp-mode)
     ("ditaa" . artist-mode)
     ("asymptote" . asy-mode)
     ("dot" . fundamental-mode)
     ("sqlite" . sql-mode)
     ("calc" . fundamental-mode)
     ("C" . c-mode)
     ("cpp" . c++-mode)
     ("C++" . c++-mode)
     ("screen" . shell-script-mode)
     ("shell" . sh-mode)
     ("bash" . sh-mode)
     ("rust" . rust-mode)))
 '(markdown-hide-markup t)
 '(package-selected-packages
   '(yasnippet-snippets company yasnippet magit lsp-ui lsp-mode flycheck cargo-mode cargo markdown-mode rust-mode catppuccin-theme ##))
 '(require-final-newline t)
 '(save-place-mode t)
 '(scroll-bar-mode nil)
 '(tab-bar-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-blockquote-face ((t nil)))
 '(markdown-code-face ((t (:background "#292c3c" :foreground "#c6d0f5"))))
 '(markdown-inline-code-face ((t (:background "#292c3c")))))

;; Catppuccin theme
(load-theme 'catppuccin :no-confirm)
(setq catppuccin-flavor 'frappe) ;; or 'latte, 'macchiato, or 'mocha
(catppuccin-reload)
(set-face-attribute 'default nil :height 100)
;;

;; credit: yorickvP on Github
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
(global-set-key "" 'yas-minor-mode)
(global-set-key (kbd "C-k") 'kill-whole-line)

  ;; keys for navigation
(define-key yas-keymap [(tab)]       nil)
(define-key yas-keymap (kbd "TAB")   nil)
(define-key yas-keymap [(shift tab)] nil)
(define-key yas-keymap [backtab]     nil)
(define-key yas-keymap (kbd "M-RET") 'yas-next-field-or-maybe-expand)
(define-key yas-keymap (kbd "C-M-<return>") 'yas-prev)
;;

;; duplicate line
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-set-key (kbd "C-d") 'duplicate-line)
;;
