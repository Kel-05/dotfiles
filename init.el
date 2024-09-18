;; use packages section
  ;; add repositories
(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
  ;;

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
	use-package-expand-minimally t))

(use-package cuda-mode)
(use-package multiple-cursors)
(use-package markdown-mode)
(use-package lsp-ui)

(use-package lsp-mode)
(use-package magit)
(use-package helm-xref)
(use-package helm-lsp)

(use-package projectile)
(use-package which-key)
(use-package catppuccin-theme)

(use-package lsp-java
  :config (add-hook 'java-mode-hook 'lsp))
(use-package flycheck
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))
(use-package yasnippet
  :config (yas-global-mode))

(use-package dap-mode
  :after lsp-mode :config (dap-auto-configure-mode))
(use-package helm
  :config (helm-mode))
(use-package company
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
  (use-package dap-cpptools))
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
 '(package-selected-packages
   '(lsp-java cuda-mode multiple-cursors dir-treeview which-key projectile helm-lsp helm-xref helm dap-mode yasnippet-snippets company yasnippet magit lsp-ui lsp-mode flycheck markdown-mode catppuccin-theme ##))
 '(require-final-newline t)
 '(save-place-mode t)
 '(scroll-bar-mode nil)
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

;; customized c-backspace
(defun custom/backward-kill-word ()
  "Remove all whitespace if the character behind the cursor is whitespace, otherwise remove a word."
  (interactive)
  (if (looking-back "[ \n]")
      ;; delete horizontal space before us and then check to see if we
      ;; are looking at a newline
      (progn (delete-horizontal-space 't)
             (while (looking-back "[ \n]")
               (backward-delete-char 1)))
      ;; else, just delete the word
      (backward-kill-word 1)))
;;

;; define keymaps
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "M-RET") yas-maybe-expand)
(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "<C-backspace>") 'custom/backward-kill-word)
(global-set-key (kbd "C-<tab>") 'other-window)

;; keys for navigation
(define-key yas-keymap [(tab)]       nil)
(define-key yas-keymap (kbd "TAB")   nil)
(define-key yas-keymap [(shift tab)] nil)
(define-key yas-keymap [backtab]     nil)
(define-key yas-keymap (kbd "M-RET") 'yas-next-field-or-maybe-expand)
(define-key yas-keymap (kbd "C-M-<return>") 'yas-prev)
;;

;; multiple cursors
(global-set-key (kbd "C-<") 'mc/mark-next-like-this)
(global-set-key (kbd "C->") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-M-<") 'mc/mark-all-like-this)
;;

;; duplicate line
(defun duplicate-up()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (previous-line 1)
  (open-line 1)
  (next-line 1)
  (yank)
)
(defun duplicate-down()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-set-key (kbd "M-<up>") 'duplicate-up)
(global-set-key (kbd "M-<down>") 'duplicate-down)
;;
