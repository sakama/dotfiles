;;================================
;; 何か最後がいいらしい
(set-default-coding-systems 'utf-8)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(rst-level-1-face ((t (:background "grey85"))) t))

;; Macのみの設定 モードラインにOS XのIME情報を
(when (eq system-type 'darwin)
  (mac-set-input-method-parameter "com.justsystems.inputmethod.atok24.Japanese" `title "漢")
  (mac-set-input-method-parameter "com.justsystems.inputmethod.atok24.Japanese" `cursor-type 'box)
  (mac-set-input-method-parameter "com.justsystems.inputmethod.atok24.Japanese" `cursor-color "magenta")
  (setq default-input-method "MacOSX")
)
