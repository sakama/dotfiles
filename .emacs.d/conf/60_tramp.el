;;================================
;; TRAMP
(require 'tramp)
;; バックアップファイルを作成しない
(add-to-list 'backup-directory-alist
	     (cons tramp-file-name-regexp nil))
