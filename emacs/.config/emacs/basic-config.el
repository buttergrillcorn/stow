(add-hook 'before-save-hook #'whitespace-cleanup)

(setq-default sentence-end-double-space nil)

(global-subword-mode 1)

(setq scroll-conservatively 1000)

(setq-default initial-major-mode 'emacs-lisp-mode)

(setq-default indent-tabs-mode nil)
(add-hook 'prog-mode-hook (lambda () (setq indent-tabs-mode nil)))

(dolist (mode '(prog-mode-hook latex-mode-hook))
  (add-hook mode #'display-line-numbers-mode))

(dolist (mode '(prog-mode-hook latex-mode-hook))
  (add-hook mode #'hs-minor-mode))

(setq backup-directory-alist `(("." . ,(expand-file-name ".tmp/backups/"
                                                         user-emacs-directory)))
      tramp-backup-directory-alist `(("." . ,(expand-file-name ".tmp/tramp-backups/"
                                                               user-emacs-directory))))

(setq backup-by-copying t)

(setq-default custom-file (expand-file-name ".custom.el" user-emacs-directory))
(when (file-exists-p custom-file) ; Don’t forget to load it, we still need it
  (load custom-file))

(setq delete-by-moving-to-trash t)

(setq-default initial-scratch-message nil)

(global-auto-revert-mode 1)

(setq undo-limit        100000000
      auto-save-default t)

(setq window-combination-resize t) ; take new window space from all other windows

(setq user-full-name       "Yu Li"
      user-real-login-name "james"
      user-login-name      "james"
      user-mail-address    "jamesyuli@outlook.com")

(setq visible-bell t)

(setq x-stretch-cursor t)

(with-eval-after-load 'mule-util
 (setq truncate-string-ellipsis "…"))

(add-to-list 'default-frame-alist '(alpha-background . 0.9))

(require 'time)
(setq display-time-format "%Y-%m-%d %H:%M")
(display-time-mode 1) ; display time in modeline

(let ((battery-str (battery)))
  (unless (or (equal "Battery status not available" battery-str)
              (string-match-p (regexp-quote "N/A") battery-str))
    (display-battery-mode 1)))

(column-number-mode)

(defvar james/default-font-size 90
  "Default font size.")

(defvar james/default-font-name "Sarasa Term SC Nerd"
  "Default font.")

(defun my/set-font ()
  (when (find-font (font-spec :name james/default-font-name))
    (set-face-attribute 'default nil
                        :font james/default-font-name
                        :height james/default-font-size)))

(my/set-font)
(add-hook 'server-after-make-frame-hook #'my/set-font)
