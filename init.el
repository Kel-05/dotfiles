;; use packages section
  ;; add melpa repository
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)
  ;;

(use-package markdown-mode)
(use-package flycheck)
(use-package lsp-ui)
(use-package lsp-mode)
(use-package magit)
(use-package yasnippet)
(use-package dap-mode)
(use-package helm)
(use-package helm-xref)
(use-package helm-lsp)
(use-package projectile)
(use-package which-key)
(use-package dir-treeview)

(use-package company
  :ensure t
  :config
  (add-to-list 'company-backends 'company-capf)
  (global-company-mode))
;;


;; C/CPP IDE
(helm-mode)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)

(which-key-mode)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)  ;; clangd is fast

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))
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
 '(custom-safe-themes
   '("b23f3067e27a9940a563f1fb3bf455aabd0450cb02c3fa4ad43f75a583311216" default))
 '(dir-treeview-show-in-side-window t)
 '(display-line-numbers t)
 '(electric-pair-mode t)
 '(font-use-system-font t)
 '(fringe-mode 0 nil (fringe))
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
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(dir-treeview which-key projectile helm-lsp helm-xref helm dap-mode yasnippet-snippets company yasnippet magit lsp-ui lsp-mode flycheck markdown-mode catppuccin-theme ##))
 '(require-final-newline t)
 '(save-place-mode t)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dir-treeview-control-face ((t (:foreground "#c6d0f5"))) t)
 '(dir-treeview-control-mouse-face ((t (:background "#C1FFC1" :foreground "#232634"))))
 '(dir-treeview-file-group-face ((t (:foreground "#e78284"))))
 '(dir-treeview-file-mode-face ((t (:foreground "#ca9ee6"))))
 '(dir-treeview-file-owner-face ((t (:foreground "#e78284"))))
 '(dir-treeview-file-size-face ((t (:foreground "#8caaee"))))
 '(dir-treeview-file-time-face ((t (:foreground "#e78284"))))
 '(dir-treeview-highlight-face ((t (:background "#a6d189" :foreground "#232634"))))
 '(dir-treeview-label-mouse-face ((t (:background "#C1FFC1" :foreground "#232634"))))
 '(dir-treeview-select-face ((t (:background "#97FFFF" :foreground "#232634"))))
 '(dir-treeview-start-dir-face ((t (:background "#D9D9D9" :foreground "#232634"))))
 '(markdown-blockquote-face ((t nil)))
 '(markdown-code-face ((t (:background "#292c3c" :foreground "#c6d0f5"))))
 '(markdown-inline-code-face ((t (:background "#292c3c")))))

;; Catppuccin theme
(load-theme 'catppuccin :no-confirm)
(setq catppuccin-flavor 'frappe) ;; or 'latte, 'macchiato, or 'mocha
(catppuccin-reload)
(set-face-attribute 'default nil :height 100)
;;

;; wlcopy - credit: yorickvP on Github
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
(global-set-key (kbd "<f9>") 'dir-treeview)

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
