;; For C-m to work
(define-key input-decode-map [?\C-m] [C-m])

(ido-mode 1)
(ido-everywhere 1)

(use-package buffer-move
  :ensure t)

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

;; --------------------------
;; Helpers for copying lines
;; --------------------------

;; duplicates line C-c d
(global-set-key (kbd "C-c d") 'duplicate-line)

(defun copy-curent-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring.
      Ease of use features:
      - Move to start of next line.
      - Appends the copy on sequential calls.
      - Use newline as last char even on the last line of the buffer.
      - If region is active, copy its lines."
    (interactive "p")
    (let ((beg (line-beginning-position))
          (end (line-end-position arg)))
      (when mark-active
        (if (> (point) (mark))
            (setq beg (save-excursion (goto-char (mark)) (line-beginning-position)))
          (setq end (save-excursion (goto-char (mark)) (line-end-position)))))
      (if (eq last-command 'copy-line)
          (kill-append (buffer-substring beg end) (< end beg))
        (kill-ring-save beg end)))
    (kill-append "\n" nil)
    (beginning-of-line (or (and arg (1+ arg)) 2))
    (if (and arg (not (= 1 arg))) (message "%d lines copied" arg)))

;; M-n copies current line (= adds to kill ring)
(global-set-key (kbd "M-n") 'copy-current-line)

;; --------------------------
;; Better defaults from Helm
;; --------------------------

;; Show visual kill-ring
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)

;; Better visual M-x
(define-key global-map (kbd "M-x") 'helm-M-x)



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

;; Moving by code blocks and brackets

(defun xah-beginning-of-line-or-block ()
  "Move cursor to beginning of line or previous paragraph.

• When called first time, move cursor to beginning of char in current line. (if already, move to beginning of line.)
• When called again, move cursor backward by jumping over any sequence of whitespaces containing 2 blank lines.

URL `http://ergoemacs.org/emacs/emacs_keybinding_design_beginning-of-line-or-block.html'
Version 2017-05-13"
  (interactive)
  (let (($p (point)))
    (if (or (equal (point) (line-beginning-position))
            (equal last-command this-command ))
        (if (re-search-backward "\n[\t\n ]*\n+" nil "NOERROR")
            (progn
              (skip-chars-backward "\n\t ")
              (forward-char ))
          (goto-char (point-min)))
      (progn
        (back-to-indentation)
        (when (eq $p (point))
          (beginning-of-line))))))

(defun xah-end-of-line-or-block ()
  "Move cursor to end of line or next paragraph.

• When called first time, move cursor to end of line.
• When called again, move cursor forward by jumping over any sequence of whitespaces containing 2 blank lines.

URL `http://ergoemacs.org/emacs/emacs_keybinding_design_beginning-of-line-or-block.html'
Version 2017-05-30"
  (interactive)
  (if (or (equal (point) (line-end-position))
          (equal last-command this-command ))
      (progn
        (re-search-forward "\n[\t\n ]*\n+" nil "NOERROR" ))
    (end-of-line)))

(global-set-key (kbd "<prior>") 'xah-beginning-of-line-or-block) ; page up key
(global-set-key (kbd "<next>") 'xah-end-of-line-or-block) ; page down key

(provide 'usability)
