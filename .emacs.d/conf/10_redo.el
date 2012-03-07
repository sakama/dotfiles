;; (install-elisp "http://www.emacswiki.org/emacs/redo+.el")
(when (require 'redo+ nil t)
   ;; global-map
     (global-set-key (kbd "C-'") 'redo)) ; C-'にredoを割り当てる
