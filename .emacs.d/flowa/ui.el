(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

(use-package cyberpunk-theme
             :ensure t
             :config
             (load-theme 'cyberpunk t)
             (set-cursor-color "yellow")
             (set-default 'fill-column 72)
             (setq ring-bell-function 'ignore))

(require 'ansi-color)

(ansi-color-for-comint-mode-on)

(setq font-lock-maximum-decoration t
      color-theme-is-global t)

;; Line-wrapping
(set-default 'fill-column 72)

;get rid of clutter
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;remove bells
(setq ring-bell-function 'ignore)

(require 'cl)

(set-frame-font "Hack-12" nil t)

;; make fringe smaller
(if (fboundp 'fringe-mode)
    (fringe-mode 4))

(provide 'ui)
