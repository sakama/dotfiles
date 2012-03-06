;;================================
;; goto-chg.el
;; M-x install-elisp-from-emacswiki goto-chg.el
(require 'goto-chg)
(define-key global-map (kbd "C-8") 'goto-last-change)
(define-key global-map (kbd "s-8") 'goto-last-change-reverse)
