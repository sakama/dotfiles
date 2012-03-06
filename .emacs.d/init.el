; load-pathを追加する関数を定義
;; Emacs 23.1 以上では user-emacs-directory 変数が用意されているのでそれを利用
(unless (boundp 'user-emacs-directory)
  (defvar user-emacs-directory (expand-file-name "~/.emacs.d/")))

(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
     (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; elispとconfディレクトリをサブディレクトリごとload-pathに追加
(add-to-load-path "elisp" "conf" "snippets")

;; init.elを分割して読み込めるようにする
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")

