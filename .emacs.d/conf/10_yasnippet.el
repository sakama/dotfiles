;;================================
;; yasnippet
(when (require 'yasnippet nil t)
  (yas/initialize)
  (yas/load-directory "~/.emacs.d/snippets")
  (setq yas/prompt-functions '(yas/dropdown-prompt)))
