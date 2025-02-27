;; use packages section
  ;; straight bootstrap
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
  ;;

(straight-use-package 'use-package)

(setq straight-use-package-by-default t
      warning-minimum-level :error)


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
(use-package yasnippet-snippets)

(use-package lsp-java)
(use-package typescript-mode)
(use-package yaml-mode)
(use-package json-mode)

(use-package php-mode)
(use-package rust-mode
  :config
  (add-hook 'rust-mode-hook (lambda () (setq indent-tabs-mode nil)))
  :config
  (add-hook 'rust-mode-hook 'cargo-minor-mode)
  :config
  (setq rust-format-on-save t))
(use-package rustic
  :config
  (setq rustic-format-on-save nil)
  :custom
  (rustic-cargo-use-last-stored-arguments t))
(use-package cargo-mode
  :config
  (setq compilation-scroll-output t))

(use-package lsp-pyright
  :custom (lsp-pyright-langserver-command "pyright")) ;; or basedpyright
(use-package flycheck
  :config (add-hook 'after-init-hook #'global-flycheck-mode))
(use-package yasnippet
  :config (yas-global-mode))
(use-package copilot
  :straight
  (:host github :repo "copilot-emacs/copilot.el" :files ("*.el"))
  :config
  (add-hook 'prog-mode-hook 'copilot-mode))

(use-package dap-mode
  :after lsp-mode :config (dap-auto-configure-mode))
(use-package helm
  :config (helm-mode))
(use-package company
  :config
  (add-to-list 'company-backends 'company-capf)
  (global-company-mode))
(use-package company-box
  :hook (company-mode . company-box-mode))
;;


;; IDE
(helm-mode)
(which-key-mode)

(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)

(defun fill-column-80 ()
  (interactive)
  (set-fill-column 80)
  (display-fill-column-indicator-mode)
)

(add-hook 'prog-mode-hook       'lsp)
(add-hook 'prog-mode-hook       'hl-line-mode)
(add-hook 'prog-mode-hook       'fill-column-80)
(add-hook 'prog-mode-hook       'display-line-numbers-mode)
(add-hook 'helm-major-mode-hook 'display-line-numbers-mode)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1) ;; clangd is fast

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools))
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
   '("8ccbbbf5c197f80c9dce116408a248fde1ac4fedd9b5b7883e729eba83c9c64e" "b23f3067e27a9940a563f1fb3bf455aabd0450cb02c3fa4ad43f75a583311216" default))
 '(dir-treeview-show-in-side-window t)
 '(electric-pair-mode t)
 '(font-use-system-font t)
 '(fringe-mode 0 nil (fringe))
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
 '(require-final-newline t)
 '(save-place-mode t)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-file "~/.emacs.d/theme.el")

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
(global-set-key (kbd "<f9>") 'treemacs)
(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)

  ;; yasnippet keymaps
(define-key yas-keymap [(tab)]       nil)
(define-key yas-keymap (kbd "TAB")   nil)
(define-key yas-keymap [(shift tab)] nil)
(define-key yas-keymap [backtab]     nil)
(define-key yas-keymap (kbd "M-RET") 'yas-next-field-or-maybe-expand)
(define-key yas-keymap (kbd "C-M-RET") 'yas-prev)
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
;;
