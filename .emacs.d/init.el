(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

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
(require 'clojure)

(provide 'init)
