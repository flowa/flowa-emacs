(use-package flycheck-clj-kondo
  :ensure t)

(use-package yasnippet
  :ensure t)

(use-package clojure-mode
  :ensure t
  :init
  (setq clojure-indent-style "always-indent")
  :config
  (require 'flycheck-clj-kondo)
  (setq cider-clojure-cli-global-options "-A:env/test"))

(use-package paredit
             :ensure t
             :config
	     (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
	     (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
	     (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
	     (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
	     (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
	     (add-hook 'clojure-mode-hook          #'enable-paredit-mode)
	     (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
	     (add-hook 'scheme-mode-hook           #'enable-paredit-mode)
	     (add-hook 'cider-repl-mode-hook       #'enable-paredit-mode)
	     (add-hook 'cider-mode-hook            #'enable-paredit-mode))

(use-package rainbow-delimiters
             :ensure t
             :config
             (add-hook 'clojure-mode-hook             #'rainbow-delimiters-mode))


(use-package cider
             :ensure t)

(add-hook 'clojure-mode-hook #'show-paren-mode)
(setq show-paren-delay 0)

(provide 'flowa-clojure)

