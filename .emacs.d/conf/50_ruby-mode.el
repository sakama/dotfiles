;;================================
;; ruby-electric
;; M-x install-elisp RET https://raw.github.com/ruby/ruby/trunk/misc/ruby-electric.el
;; ruby-block
;; M-x auto-install-from-emacs-wiki RET ruby-block.el RET 
(require 'ruby-electric nil t)
;; endに対応する行のハイライト
(when (require 'ruby-block nil t)
  (setq ruby-block-highlight-toggle t))

;; ruby-mode-hoook用の関数を定義
(defun ruby-mode-hooks ()
  (ruby-electric-mode t)
  (ruby-block-mode t))
;; ruby-mode-hookに追加
(add-hook 'ruby-mode-hook 'ruby-mode-hooks)

;;================================
;; autotest
(require 'autotest)
(define-key ruby-mode-map "\C-c\C-a" 'autotest-switch)
(define-key shell-mode-map "\C-c\C-a" 'autotest-switch)
