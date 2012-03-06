;;================================
;; ElScreen
(setq elscreen-prefix-key "\C-t")
(require 'elscreen nil t)
  (if window-system
	 (define-key elscreen-map "\C-t" 'iconify-or-deiconify-frame)
     (define-key elscreen-map "\C-t" 'suspend-emacs))
;;================================
