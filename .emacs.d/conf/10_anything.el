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


;;================================
;; catgs.elの設定
(require 'ctags nil t)
(setq tags-revert-without-query t)
;; ctagsを呼び出すコマンドライン。パスが通っていればフルパスでなくてもよい
;; etags互換タグを利用する場合はコメントを外す
;; (setq ctags-command "ctags -e -R ")
;; anything-exuberant-ctags.elを利用しない場合はコメントアウトする
(setq ctags-command "ctags -R --fields=\"+afikKlmnsSzt\" ")
(global-set-key (kbd "<f5>") 'ctags-create-or-update-tags-table)

;; gtags-modeのキーバインドを有効化する
(setq gtags-suggested-key-mapping t)
;;(require 'gtags nil t)
;; AnythingからTAGSを利用しやすくするコマンド作成
(when (and (require 'anything-exuberant-ctags nil t)
           ;;(require 'anything-gtags nil t)
           )
;; anything-for-tags用のソースを定義
(setq anything-for-tags
      (list anything-c-source-imenu
           ;; anything-c-source-gtags-select
            ;; etagsを利用する場合はコメントを外す
            ;; anything-c-source-etags-select
            anything-c-source-exuberant-ctags-select
            ))

;; anything-for-tagsコマンドを作成
(defun anything-for-tags ()
  "Preconfigured 'anything' for anything-for-tags."
  (interactive)
  (anything anything-for-tags
            (thing-at-point 'symbol)
            nil nil nil "*anything for tags*"))

;; M-tにanything-for-tagsを割り当て
(define-key global-map (kbd "M-t") 'anything-for-tags)) 