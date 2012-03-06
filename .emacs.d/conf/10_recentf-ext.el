;;================================
;; M-x install-elisp-from-emacswiki recentf-ext.el 
;; recentf-ext.el
;; 最近のファイル3000個を保存する
(require 'recentf-ext)
(setq recentf-max-saved-items 3000)
;; 最近使ったファイルに加えないファイルを正規表現で指定する
;; (setq recentf-exclude '("TAGS$" "/var/tmp/"))
(global-set-key (kbd "C--") 'recentf-open-files) 
