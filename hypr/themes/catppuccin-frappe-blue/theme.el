(set-face-attribute 'markdown-blockquote-face nil)
(set-face-attribute 'markdown-code-face t
		    :background "#292c3c"
		    :foreground "#c6d0f5")
(set-face-attribute 'markdown-inline-code-face t
		    :background "#292c3c")

;; Catppuccin theme
(load-theme 'catppuccin :no-confirm)
(setq catppuccin-flavor 'frappe) ;; or 'latte, 'macchiato, or 'mocha
(catppuccin-reload)
(set-face-attribute 'default nil :height 100)
;;
