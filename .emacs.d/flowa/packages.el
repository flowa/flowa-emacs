(use-package projectile
  :ensure t
  :bind
  (("C-c p k" . projectile-kill-buffers))
  :config
  (projectile-mode +1))

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
  :init
  (global-flycheck-mode)
  (setq-default flycheck-disabled-checkers
		(append flycheck-disabled-checkers
			'(javascript-jshint))))

(use-package docker-compose-mode
  :ensure t)

(use-package yaml-mode
  :ensure t
  :init (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))

(use-package org
  :ensure t
  :init (add-to-list 'auto-mode-alist '("\\.org$" . org-mode)))

(provide 'packages)
