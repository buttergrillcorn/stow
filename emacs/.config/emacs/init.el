;; Make Emacs treat the folder of this init.el as its base directory
(setq user-emacs-directory
      (file-name-directory (or load-file-name buffer-file-name)))

(dolist (module '(nil))
  (load (expand-file-name module user-emacs-directory)))
