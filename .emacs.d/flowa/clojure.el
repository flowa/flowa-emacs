(use-package clojure-mode
             :ensure t)

(use-package paredit
             :ensure t
             :config
             (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
             (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
             (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
             (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
             (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
             (add-hook 'clojure-mode-hook             #'enable-paredit-mode)
             (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
             (add-hook 'scheme-mode-hook           #'enable-paredit-mode))

(use-package rainbow-delimiters
             :ensure t
             :config
             (add-hook 'clojure-mode-hook             #'rainbow-delimiters-mode))


(use-package cider
             :ensure t)

(add-hook 'clojure-mode-hook #'show-paren-mode)
(setq show-paren-delay 0)

(provide 'clojure)
