;;; flowa-mac.el --- Sane settings for mac

;;; Commentary:
;; Tweaks and tricks to get Emacs working on Mac OSX

;;; Code:
(defvar mac-osx)
(setq mac-osx (eq system-type 'darwin))

;; When starting emacs from Applications and not from shell, OSX does not set PATH to emacs exec-path
;; That's why we will set the current Path manually to exec path here
;; See https://stackoverflow.com/questions/8606954/path-and-exec-path-set-but-emacs-does-not-find-executable
(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.
This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(when mac-osx

  (set-exec-path-from-shell-PATH)
  
  ;; Needed for getting lein to exec-path
  (add-to-list 'exec-path "/opt/homebrew/bin")
  
  ;; For mac keyboard layout which does not have the right control
  ;; Bind right option as ctrl to get control keys for both hands
  ;;(setq mac-right-option-modifier 'control)
  ;;(setq mac-option-modifier 'none)

  ;; Set command as Meta to get the normal emacs meta key position
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'none))

(provide 'flowa-mac)
;;; flowa-mac ends here

