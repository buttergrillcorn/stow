(use-package which-key
  :straight (:build t)
  :defer t
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(use-package general
  :straight (:build t)
  :init
  (general-auto-unbind-keys)
  :config
  (general-create-definer james/undefine
    :keymaps 'override
    :states '(normal emacs))
  (general-create-definer james/evil
    :states '(normal))
  (general-create-definer james/leader-key
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "C-SPC")
  (general-create-definer james/major-leader-key
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC m"
    :global-prefix "M-m"))

(use-package evil
  :straight (:build t)
  :after (general)
  :init
  (setq evil-want-integration t
        evil-want-keybinding nil
        evil-want-C-u-scroll t
        evil-want-C-i-jump nil)
  (require 'evil-vars)
  :config
  
  
  (evil-mode 1)
  (setq evil-want-fine-undo t) ; more granular undo with evil
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))
