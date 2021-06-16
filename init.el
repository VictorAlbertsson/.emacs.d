;; I manage my Emacs packages with Nix so there are no use-package
;; forms and no package-initialize

;; I place my config files under the 'config' subdirectory and the
;; following code snippet automatically loads all .el files there
(let ((emacs-dir (file-name-directory user-init-file))
      (config-dir (expand-file-name "config" (file-name-directory user-init-file))))
  (dolist (file (directory-files config-dir))
    (when (string-match "\\.el$" file)
      (load (expand-file-name file config-dir))))
  (load (setq custom-file (expand-file-name "custom.el" emacs-dir))))
