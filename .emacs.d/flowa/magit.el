(use-package forge
  :ensure t
  :after magit
  :config
  (when (require 'private-forge nil t)))

(use-package magit
  :ensure t)

(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode +1))

(provide 'magit)
