(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(setq load-path (cons "~/.personal-emacs" load-path))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/flowa"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/flowa/vendor"))

(setq custom-file "~/.emacs.d/custom.el")

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(package-install 'gnu-elpa-keyring-update)

(eval-when-compile
  (require 'use-package))

(require 'ui)
(require 'packages)
(require 'usability)
(require 'web)
(require 'flowa-clojure)
(require 'flowa-elixir)
(require 'flowa-magit)
(require 'terraform)
(require 'jenkins)
(require 'flowa-go)
(require 'flowa-mac)

(setq javascript-indent-level 2)
(setq js-indent-level 2)

(provide 'init)
;;; init.el ends here
