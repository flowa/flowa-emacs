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
  (setq cider-clojure-cli-global-options "-A:dev:test:cider")
  (setq cider-inject-dependencies-at-jack-in t))
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

(use-package company
  :ensure t)

(use-package lsp-treemacs
  :ensure t)

(setq lsp-bin (if (string-empty-p (getenv "LSP_PATH"))
		    (getenv "LSP_PATH")
		  "/home/evilpupu/opt/lsp/clojure-lsp"))


(use-package lsp-mode
  :ensure t
  :hook ((clojure-mode . lsp)
         (clojurec-mode . lsp)
         (clojurescript-mode . lsp)
	 (elixir-mode . lsp))
  :init
  (add-to-list 'exec-path "/home/evilpupu/opt/elixir-ls")
  :config
  ;; add paths to your local installation of project mgmt tools, like lein
  (setenv "PATH" (concat
                   "/usr/local/bin" path-separator
                   (getenv "PATH")))
  (dolist (m '(clojure-mode
               clojurec-mode
               clojurescript-mode
               clojurex-mode))
     (add-to-list 'lsp-language-id-configuration `(,m . "clojure")))
  (setq lsp-clojure-server-command "/home/evilpupu/opt/lsp/clojure-lsp"))
  (with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.postgres-data\\'")
  ;; or
  (add-to-list 'lsp-file-watch-ignored-files "[/\\\\]\\.my-files\\'"))


(provide 'flowa-clojure)

