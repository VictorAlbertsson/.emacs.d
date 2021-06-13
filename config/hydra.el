;;; -*- lexical-binding: t -*-
(require 'hydra)

(defvar hydra-stack nil)

(defun hydra-push (expr)
  (push expr hydra-stack))

(defun hydra-pop ()
  (interactive)
  (let ((x (pop hydra-stack)))
    (when x
      (call-interactively x))))

(defun hydra-escape ()
  (interactive)
  (setq hydra-stack nil))

(defmacro hydra-open (hydra)
  `(progn
     (hydra-push hydra-curr-body-fn) ; hydra-curr-body-fn is a lexically bound variable
     (call-interactively ',hydra)))

;; Keybinding defined in which-key.el
(defhydra hydra-master (:color teal)
  "Master"
  ("t" (hydra-open hydra-text/body) "Text")
  ("c" (hydra-open hydra-multiple-cursors/body) "Cursors") ; multiple-cursors.el
  ("q" hydra-pop "Quit")
  ("<menu>" hydra-escape "Escape"))

(defhydra hydra-text (:color teal)
  "Text"
  ("i" text-scale-increase "In" :exit nil)
  ("o" text-scale-decrease "Out" :exit nil)
  ("c" forward-char "Forward character" :exit nil)
  ("C" backward-char "Backward character" :exit nil)
  ("w" forward-word "Forward word" :exit nil)
  ("W" backward-word "Backward word" :exit nil)
  ("q" hydra-pop "Quit")
  ("<menu>" hydra-escape "Escape"))

;; TODO: Hydra inheritance?
(defhydra hydra-template (:color teal)
  "Template"
  ("q" hydra-pop "Quit")
  ("<menu>" hydra-escape "Escape"))
