;;================================

;; anything
;; (auto-install-batch "anything")
(when (require 'anything nil t)
  (setq
   ;; 候補を表示するまでの時間。デフォルトは0.5
   anything-idle-delay 0.3
   ;; タイプして再描画するまでの時間。デフォルトは0.1
   anaything-input-idle-delay 0.2
   ;; 候補の最大表示数。デフォルトは50
   anything-candidate-number-limit 100
   ;; 候補が多いときに体感速度を早くする
   anything-quick-update t
   ;; 候補選択ショートカットをアルファベットに
   anything-enable-shortcuts 'alphabet)

(when (require 'anything-config nil t)
  ;; root権限でアクションを実行するときのコマンド
  ;; デフォルトは"su"
  (setq anything-su-or-sudo "sudo"))

(when(require 'anything-match-plugin nil t)
;;(and (equal current-language-environment "Japanese")
;;     (executable-find "cmigemo")
;;     (require 'anything-migemo nil t)
)
(when (require 'anything-migemo nil t))
;;(when (require 'anything-complete nil t)
   ;;M-Xによる補完をAnythingで行う
;;   (anything-read-string-mode 1)
   ;;Lispシンボルの補完候補の再建策時間
;;  (anything-lisp-complete-symbol-set-timer 150)
)
;; anythingをC-;で起動
(global-set-key [?\C-\;] 'anything)

