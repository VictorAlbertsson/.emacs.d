(require 'which-key)

(which-key-mode)

(global-set-key
 (kbd "<menu>")
 (lambda ()
   (interactive)
   (pcase major-mode
     ;; Major mode specific hydras go here
     (_ (hydra-open hydra-master/body)))))

;;; which-key configuration options goes here
