;; (install-elisp "http://www.emacswiki.org/emacs/redo+.el")
(when (require 'redo+ nil t)
   ;; global-map
     (global-set-key (kbd "C-_") 'redo)) ; C_にredoを割り当てる
