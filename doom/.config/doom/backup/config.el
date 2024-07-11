;;; This dotfile is managed using dotdrop
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "James"
      user-mail-address "jamesyuli@outlook.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:

(setq doom-font (font-spec :family "Sarasa Term SC Nerd" :size 15 :weight 'Semibold)
      doom-variable-pitch-font (font-spec :family "Sarasa Term SC Nerd" :size 15)
      doom-unicode-font (font-spec :family "Symbols Nerd Font Mono" :size 16))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/denote")

;; Org Capture
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
          ))
  ;; Org Agenda Files
  (setq org-agenda-files '("~/denote/meta"))
  ;; Org Babel
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (emacs-lisp . t)
     (python . t)
     (conf-toml . t)
     (rust . t)
     ))
  (setq org-hide-emphasis-markers t)
  (setq org-pretty-entities t))

(setq +format-on-save-disabled-modes
      '(org-mode))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Load external files
;; (load! "font.el")

;; Keybinds
(map! "C-h" 'switch-to-prev-buffer)
(map! "C-l" 'switch-to-next-buffer)
(map! "C-S-l" 'recenter-top-bottom)

;; Which-key
;; (setq which-key-idle-delay 0.2)
(setq auto-save-visited-interval 15)
(auto-save-visited-mode +1)

;; Org auto list
(add-hook 'org-mode-hook
          (lambda () (org-autolist-mode)))

;; Projects
;; (projectile-add-known-project "~/org")
(projectile-add-known-project "~/denote")
;; (projectile-add-known-project "~/roam")
(projectile-add-known-project "~/stow")

;; Shell
;; (setq shell-file-name (executable-find "bash"))
;; (setq-default vterm-shell (executable-find "fish"))
;; (setq-default explicit-shell-file-name (executable-find "fish"))

;; dimmer
;; (use-package! dimmer
;;   :init
;;   (dimmer-mode)
;;   (setq dimmer-fraction 0.3)
;;   (dimmer-configure-which-key)
;;   (dimmer-configure-magit))

;; Zoom
;; (use-package! zoom
;;   :init
;;   (zoom-mode t))
;; (custom-set-variables
;;  '(zoom-ignored-major-modes '(which-key-mode)))

;; Beacon
;; (use-package! beacon
;;   :init
;;   (beacon-mode t))

;; Golden Ratio
;; (use-package! golden-ratio
;;   :init
;;   (golden-ratio-mode 1)
;;   (setq golden-ratio-auto-scale 1))

;; Org Modern
;; (after! org
;;   (setq
;;    ;; Edit settings
;;    org-auto-align-tags nil
;;    org-tags-column 0
;;    org-catch-invisible-edits 'show-and-error
;;    org-special-ctrl-a/e t
;;    org-insert-heading-respect-content t

;;    ;; Org styling, hide markup etc.
;;    org-hide-emphasis-markers t
;;    org-pretty-entities t

;;    ;; Agenda styling
;;    org-agenda-tags-column 0
;;    org-agenda-block-separator ?─
;;    org-agenda-time-grid
;;    '((daily today require-timed)
;;      (800 1000 1200 1400 1600 1800 2000)
;;      " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
;;    org-agenda-current-time-string
;;    "◀── now ─────────────────────────────────────────────────")

;;   ;; Ellipsis styling
;;   (setq org-ellipsis "…")
;;   (set-face-attribute 'org-ellipsis nil :inherit 'default :box nil)
;;   (global-org-modern-mode))

;; Org Super Agenda
;; (after! org
;;   (setq org-super-agenda-mode t)
;;   (let ((org-super-agenda-groups
;;          '(;; Each group has an implicit boolean OR operator between its selectors.
;;            (:name "Today"  ; Optionally specify section name
;;             :time-grid t  ; Items that appear on the time grid
;;             :todo "TODAY")  ; Items that have this TODO keyword
;;            (:name "Important"
;;             ;; Single arguments given alone
;;             ;; :tag "bills"
;;             :priority "A")
;;            ;; Set order of multiple groups at once
;;            ;; (:order-multi (2 (:name "Shopping in town"
;;            ;;                   ;; Boolean AND group matches items that match all subgroups
;;            ;;                   :and (:tag "shopping" :tag "@town"))
;;            ;;                  (:name "Food-related"
;;            ;;                   ;; Multiple args given in list with implicit OR
;;            ;;                   :tag ("food" "dinner"))
;;            ;;                  (:name "Personal"
;;            ;;                   :habit t
;;            ;;                   :tag "personal")
;;            ;;                  (:name "Space-related (non-moon-or-planet-related)"
;;            ;;                   ;; Regexps match case-insensitively on the entire entry
;;            ;;                   :and (:regexp ("space" "NASA")
;;            ;;                         ;; Boolean NOT also has implicit OR between selectors
;;            ;;                         :not (:regexp "moon" :tag "planet")))))
;;            ;; Groups supply their own section names when none are given
;;            (:todo "WAITING" :order 8)  ; Set order of this section
;;            (:todo ("SOMEDAY" "TO-READ" "CHECK" "TO-WATCH" "WATCHING")
;;             ;; Show this group at the end of the agenda (since it has the
;;             ;; highest number). If you specified this group last, items
;;             ;; with these todo keywords that e.g. have priority A would be
;;             ;; displayed in that group instead, because items are grouped
;;             ;; out in the order the groups are listed.
;;             :order 9)
;;            (:priority<= "B"
;;             ;; Show this section after "Today" and "Important", because
;;             ;; their order is unspecified, defaulting to 0. Sections
;;             ;; are displayed lowest-number-first.
;;             :order 1)
;;            ;; After the last group, the agenda will display items that didn't
;;            ;; match any of these groups, with the default order position of 99
;;            )))
;;     (org-agenda nil "a")))

;; Centaur Tab
;; (after! centaur-tabs
;;   (centaur-tabs-group-by-projectile-project))

;; Pomodoro
(setq org-pomodoro-length 30)

;; Org Habit Status
;; (map! :map org-mode-map
;;       "C-c h" 'org-habit-stats-view-habit-at-point)
;; (map! :map org-agenda-mode-map
;;       "H" 'org-habit-stats-view-habit-at-point-agenda)
;; (
;; add-hook 'org-after-todo-state-change-hook 'org-habit-stats-update-properties)

;; Org Heatmap
(use-package org-habit
  :custom
  (org-habit-graph-column 1)
  (org-habit-preceding-days 10)
  (org-habit-following-days 1)
  (org-habit-show-habits-only-for-today nil))

(use-package org-heatmap
  :init
  ;; (add-to-list 'load-path "/path-to/emacsql/")
  (add-to-list 'load-path "~/.config/doom/custom/org-heatmap/")
  (require 'org-heatmap)
  :after (org)
  :custom
  (org-agenda-files '("~/denote/meta/"))
  ;; (org-heatmap-db-location "~/.config/doom/custom/org-heatmap/examples/org-heatmap.db")
  :config
  (org-heatmap-mode))

;; Denote
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

(map!
 :leader
 (:prefix-map ("d" . "denote")
  :desc "Search notes" "s" #'consult-denote-find
  :desc "Search notes w/grep" "S" #'consult-denote-grep))

(after! denote
  (setq denote-directory "~/denote")
  (setq denote-known-keywords nil))

;; Org Appear
(after! org
  (add-hook 'org-mode-hook 'org-appear-mode))

;; ;; Clipboard
;; ;; Copying
;; (call-process "wl-copy"
;;               nil
;;               nil
;;               nil
;;               "--"
;;               (buffer-substring (region-beginning) (region-end)))
;; ;; Pasting
;; (insert
;;  (with-temp-buffer
;;    (call-process "wl-paste" nil t nil "--no-newline")
;;    (buffer-string))
;; ;; Pasting
;; (insert
;;  (with-temp-buffer
;;    (call-process "wl-paste" nil t nil "--no-newline")
;;    (buffer-string)))

;; Consult Notes
(use-package! consult-notes
  :init
  (setq consult-notes-file-dir-sources
        '(("Denote" ?d "~/denote/")))
  (consult-notes-org-headings-mode)
  (when (locate-library "denote")
    (consult-notes-denote-mode))
  ;; search only for text files in denote dir
  (setq consult-notes-denote-files-function (function denote-directory-text-only-files)))
;; Keymap
;; (map!
;;  :leader
;;  (:prefix-map ("d" . "denote")
;;   :desc "Search notes" "s" #'consult-notes
;;   :desc "Grep notes" "S" #'consult-notes-search-in-all-notes))

;; Org Roam Logseq
;; (load! "custom/org-roam-logseq")
;; (use-package org-roam
;;   :config
;;   (setq
;;    ;; your shared directory between Logseq and org-roam
;;    org-roam-directory "~/roam"
;;    ;; dailies directory is set to the Logseq default
;;    org-roam-dailies-directory "journals/"
;;    ;; exclude all syncthing folders and anything under logseq/ from being indexed by org-roam
;;    org-roam-file-exclude-regexp "\\.st[^/]*\\|logseq/.*$")
;;   ;; ensure org-roam is creating nodes similarly to Logseq
;;   ;; bear in mind that it won't be exact mapping due to Logseq's built-in
;;   ;;    :file/name-format :triple-lowbar
;;   (setq org-roam-capture-templates '(("d" "default"
;;                                       plain
;;                                       "%?"
;;                                       :target (file+head "pages/${slug}.org" "#+title: ${title}\n")
;;                                       :unnarrowed t)))

;;   ;; ensure your org-roam daily template follows the journal settings in Logseq
;;   ;;    :journal/page-title-format "yyyy-MM-dd"
;;   ;;    :journal/file-name-format "yyyy_MM_dd"
;;   (setq org-roam-dailies-capture-templates '(("d" "default"
;;                                               entry
;;                                               "* %?"
;;                                               :target (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n"))))
;;   )
