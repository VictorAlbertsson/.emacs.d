;; I manage my Emacs packages with Guix
(add-to-list 'load-path "/home/victor/.guix-profile/share/emacs/site-lisp")
(guix-emacs-autoload-packages)

;; I place my config files under the 'config' subdirectory
(let ((emacs-dir (file-name-directory user-init-file))
      (config-dir (expand-file-name "config" (file-name-directory user-init-file))))
  (dolist (file (directory-files config-dir))
    (when (string-match "\\.el$" file)
      (load (expand-file-name file config-dir))))
  (load (setq custom-file (expand-file-name "custom.el" emacs-dir))))
