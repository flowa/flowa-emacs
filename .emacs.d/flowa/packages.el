(use-package helm
             :ensure t)
(use-package helm-projectile
             :ensure t
             :bind
             (("C-c p h" . helm-projectile))
	     :config
	     (projectile-global-mode)
	     (setq projectile-completion-system 'helm)
	     (helm-projectile-on))

(use-package undo-tree
  :ensure t)

(use-package ag
  :ensure t
  :config
  (global-undo-tree-mode))

(use-package auto-complete
  :ensure t
  :config
  (ac-config-default))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(provide 'packages)
