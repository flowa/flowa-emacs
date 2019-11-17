(ido-mode 1)
(ido-everywhere 1)

;; IDO for M-x
(global-set-key
     "\M-x"
     (lambda ()
       (interactive)
       (call-interactively
        (intern
         (ido-completing-read
          "M-x "
          (all-completions "" obarray 'commandp))))))

;; Move backup files away from wd

(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; disable emacs interlock files (this may cause problems when editing same
;; file with two instances of emacs. but who would do that.
(setq create-lockfiles nil)

;; ---------------
;; Resize windows
;; ---------------

(global-set-key (kbd "C-å") 'enlarge-window)
(global-set-key (kbd "C-ä") 'shrink-window)

(global-set-key (kbd "C-.") 'enlarge-window-horizontally)
(global-set-key (kbd "C-,") 'shrink-window-horizontally)

;; Revert buffer easily
(global-set-key (kbd "C-c r") 'revert-buffer)

; Open buffer menu in the active window
(global-set-key (kbd "C-x C-b") 'buffer-menu)

;; Text size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; duplicates line C-c d
(global-set-key (kbd "C-c d") 'duplicate-line)

;; Enable switching between windows with s-<arrow-keys>
(windmove-default-keybindings)

;; Desktop save mode
(desktop-save-mode 1)

;; Savehist mode
(savehist-mode 1)

;; reload config
(defun reload ()
  "Reloads the emacs conf file(s)"
  (interactive)
  (load-file (expand-file-name user-init-file)))

(provide 'usability)
