(defun james/open-marked-files (&optional files)
  "Open all marked FILES in Dired buffer as new Emacs buffers."
  (interactive)
  (let* ((file-list (if files
                        (list files)
                      (if (equal major-mode "dired-mode")
                          (dired-get-marked-files)
                        (list (buffer-file-name))))))
   (mapc (lambda (file-path)
           (find-file file-path))
         (file-list))))

(defun split-window-right-and-focus ()
  "Spawn a new window right of the current one and focus it."
  (interactive)
  (split-window-right)
  (windmove-right))

(defun split-window-below-and-focus ()
  "Spawn a new window below the current one and focus it."
  (interactive)
  (split-window-below)
  (windmove-down))

(with-eval-after-load 'hydra
  (defhydra windows-adjust-size ()
    "
             _j_: shrink
_h_: enlarge              _l_: right
             _k_: enlarge
"
    ("h" enlarge-window-horizontally)
    ("j" shrink-window)
    ("k" enlarge-window)
    ("l" shrink-window-horizontally)))

(defun switch-to-messages-buffer ()
  "Switch to Messages buffer."
  (interactive)
  (switch-to-buffer (messages-buffer)))

(defun switch-to-scratch-buffer ()
  "Switch to Messages buffer."
  (interactive)
  (switch-to-buffer "*scratch*"))
