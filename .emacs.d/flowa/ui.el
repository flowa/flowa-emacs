(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

(use-package cyberpunk-theme
             :ensure t
             :config
             (load-theme 'cyberpunk t)
             (set-cursor-color "yellow")
             (set-default 'fill-column 72)
             (setq ring-bell-function 'ignore)
)

(provide 'ui)
