;;================================
;; scss-mode
(when (require 'scss-mode nil t)
  (setq scss-compile-at-save nil) ;; 自動コンパイルをオフにする
  (add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode)))
