
(add-to-list 'load-path "~/.emacs.d/")

;; Miscellaneous settings

(fset 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(mouse-wheel-mode t)
(show-paren-mode t)

;; Hook functions

(defun c++-hook ()
  (linum-mode 1))

(defun c-hook ()
  (linum-mode 1))

(defun emacs-lisp-hook ()
  (linum-mode 1))

(add-hook 'c++-mode-hook 'c++-hook)
(add-hook 'c-mode-hook 'c-hook)
(add-hook 'emacs-lisp-mode-hook 'emacs-lisp-hook)

;; Key binding functions

(defun small-scroll-down ()
  (interactive)
  (scroll-down 4))

(defun small-scroll-up ()
  (interactive)
  (scroll-up 4))

(defun move-backwards ()
  (interactive)
  (other-window -1))

(global-set-key [f1] 'goto-line)
(global-set-key [f2] 'revert-buffer)
(global-set-key [(meta left)] 'backward-sexp)
(global-set-key [(meta right)] 'forward-sexp)
(global-set-key [next] 'scroll-up-command)
(global-set-key [prior] 'scroll-down-command)
(global-set-key [home] 'small-scroll-down)
(global-set-key [end] 'small-scroll-up)
(global-set-key (kbd "C-x p") 'move-backwards)

;; Style settings

(setq c-default-style "linux" c-basic-offset 3)
(setq c++-default-style "linux" c++-basic-offset 3)
(global-visual-line-mode t)
(set-scroll-bar-mode 'right)
(set-foreground-color "white")
(set-background-color "black")

;; Backup file behavior

(setq vc-make-backup-files t)
(setq version-control t
      kept-new-versions 4
      kept-old-versions 0
      delete-old-versions t
      backup-by-copying t)
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))

; Courtesy of www.emacswiki.org/emacs/ForceBackups
(defun force-backup-of-buffer ()
  ;; Make a special "per session" backup at the first save of each
  ;; emacs session.
  (when (not buffer-backed-up)
    ;; Override the default parameters for per-session backups.
    (let ((backup-directory-alist '(("" . "~/.emacs.d/backup/per-session")))
	  (kept-new-versions 4))
      (backup-buffer)))
  ;; Make a "per save" backup on each save.  The first save results in
  ;; both a per-session and a per-save backup, to keep the numbering
  ;; of per-save backups consistent.
  (let ((buffer-backed-up nil))
    (backup-buffer)))

