(use-package helm
             :ensure t)
(use-package helm-projectile
             :ensure t
             :bind
             (("C-c p h" . helm-projectile)))

(use-package undo-tree
  :ensure t)

(use-package ag
  :ensure t
  :config
  (global-undo-tree-mode))

(provide 'packages)
