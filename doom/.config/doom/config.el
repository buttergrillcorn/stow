;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; DO NOT EDIT THIS FILE DIRECTLY
;; This is a file generated from a literate programing source file located at
;; https://gitlab.com/zzamboni/dot-doom/-/blob/master/doom.org
;; You should make any changes there and regenerate it from Emacs org-mode
;; using org-babel-tangle (C-c C-v t)

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
;; (setq user-full-name "John Doe"
;;      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; (setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq user-full-name "James"
      user-mail-address "jamesyuli@outlook.com")

(setq doom-font (font-spec :family "Sarasa Term SC Nerd" :size 15 :weight 'Semibold)
      doom-variable-pitch-font (font-spec :family "Sarasa Term SC Nerd" :size 15)
      doom-unicode-font (font-spec :family "Symbols Nerd Font Mono" :size 16))

(setq doom-theme 'doom-gruvbox)

(setq display-line-numbers-type 'relative)

(map! "C-h" 'switch-to-prev-buffer)
(map! "C-l" 'switch-to-next-buffer)
(map! "C-S-l" 'recenter-top-bottom)

;; (setq which-key-idle-delay 0.2)
(setq auto-save-visited-interval 15)
(auto-save-visited-mode +1)

(setq org-directory "~/denote")

(after! org
  (setq org-capture-templates
        `(("t" "Todo" entry (file "~/denote/meta/todo.org")
           "* TODO %U %?" :empty-lines-after 1)
          ("i" "Inbox" entry (file "~/denote/meta/inbox.org")
           "* %t %?" :empty-lines-after 1)
          ;; ("w" "Work" entry (file "~/org/work.org")
          ;;  "* %t %?  %(org-set-tags \"work\")" :empty-lines-after 1)
          ;; ("j" "Journal" entry (file+datetree "~/org/journal.org")
          ;;  "* %?" :jump-to-captured t :time-prompt t)
          )))

(after! org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (emacs-lisp . t)
     (python . t)
     (conf-toml . t)
     (rust . t)
     )))

(after! org
  (setq org-hide-emphasis-markers t)
  (setq org-pretty-entities t))

(setq +format-on-save-disabled-modes
      '(org-mode))

(setq org-pomodoro-length 30)

(after! org
  (setq org-agenda-files '("~/denote/meta")))

(add-hook 'org-mode-hook
          (lambda () (org-autolist-mode)))

(after! org
  (add-hook 'org-mode-hook 'org-appear-mode))

(after! denote
  (setq denote-directory "~/denote")
  (setq denote-known-keywords nil))

(map! :leader
      (:prefix-map ("d" . "denote")
       :desc "new note" "d" #'denote
       :desc "new note + date" "D" #'denote-date
       ;; :desc "new note in subdir" "s" #'denote-subdirectory
       :desc "list all notes" "f" #'denote-menu-list-notes
       :desc "open note" "o" #'denote-open-or-create
       :desc "find link" "l" #'denote-find-link
       :desc "backlinks" "b" #'denote-backlinks
       :desc "backlink for heading" "H" #'denote-org-extras-link-to-heading
       :desc "find/create journal" "j" #'denote-journal-extras-new-or-existing-entry
       :desc "find/create journal w/date" "J" #'(lambda ()
                                                  (interactive)
                                                  (let ((current-prefix-arg '(4)))
                                                    (call-interactively #'denote-journal-extras-new-or-existing-entry)))
       :desc "template" "t" #'denote-template
       (:prefix ("i" . "insert")
        :desc "insert/create link" "l" #'denote-link-or-create
        :desc "insert/create link in bg" "L" #'denote-link-after-creating
        :desc "insert front matter" "f" #'denote-add-front-matter
        :desc "insert heading link" "h" #'denote-org-extras-link-to-heading
        :desc "insert journal link" "j" #'denote-journal-extras-link-or-create-entry
        :desc "insert journal link w/date" "J" #'(lambda ()
                                                   (interactive)
                                                   (let ((current-prefix-arg '(4)))
                                                     (call-interactively #'denote-journal-extras-link-or-create-entry)))
        :desc "insert link matching REGEXP" "r" #'denote-add-links)
       (:prefix ("r" . "rename")
        :desc "rename note" "r" #'denote-rename-file
        :desc "rename keyword" "k" #'denote-rename-file-keywords
        :desc "rename signature" "s" #'denote-rename-file-signature
        :desc "rename front matter" "f" #'denote-rename-file-using-front-matter
        :desc "rename title" "t" #'denote-rename-file-title)))

(map! :leader
      (:prefix-map ("d" . "denote")
       :desc "Search notes" "s" #'consult-denote-find
       :desc "Search notes w/grep" "S"
       #'consult-denote-grep))

;; (projectile-add-known-project "~/org")
(projectile-add-known-project "~/denote")
;; (projectile-add-known-project "~/roam")
(projectile-add-known-project "~/stow")
