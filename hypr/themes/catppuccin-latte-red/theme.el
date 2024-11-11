(set-face-attribute 'markdown-blockquote-face nil)
(set-face-attribute 'markdown-code-face t
		    :background "#e6e9ef"
		    :foreground "#4c4f69")
(set-face-attribute 'markdown-inline-code-face t
		    :background "#e6e9ef")

;; Catppuccin theme
(load-theme 'catppuccin :no-confirm)
(setq catppuccin-flavor 'latte) ;; or 'latte, 'macchiato, or 'mocha
(catppuccin-reload)
(set-face-attribute 'default nil :height 100)
;;
