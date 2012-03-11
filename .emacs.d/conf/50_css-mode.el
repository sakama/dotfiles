;; cssm-mode
;; M-x install-elisp RET http://www.garshol.priv.no/download/software/css-mode/css-mode.el
(defun css-mode-hooks()
  "css-mode hooks"
  ;; インデントをCスタイルにする
  (setq cssm-indent-function #'cssm-c-style-indenter)
  ;; インデント幅を2にする
  (setq cssm-indent-level 4)
  ;; インデントにタブ文字を使わない
  ;;(setq-default indent-tabs-mode nil)
  ;; 閉じ括弧の前に改行を挿入する
  (setq cssm-newline-before-closing-bracket t))

(add-hook 'css-mode-hook 'css-mode-hooks)
