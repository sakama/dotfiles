;;================================

;;オートセーブOFF
(setq auto-save-default nil) ;デフォルトはt

;; バックアップOFF
;;(setq make-backup-files nil) ;デフォルトはt

;; バックアップファイル、オートセーブファイルの作成場所を変更 
(add-to-list 'backup-directory-alist
             (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; #!なファイルの保存時に実行属性を付与する
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;;================================
;; Lisp nesting exceeds 'max-lisp-eval-depth'のエラー対策
(setq max-lisp-eval-depth 5000)
(setq max-specpdl-size 5000)

;;================================
;; paren mode 対応する括弧を強調して表示する
(setq show-paren-delay 0) ;表示するまでの秒数。初期値は0.125
(show-paren-mode t) ;有効化
;; parenのスタイル: expressionは括弧内も強調表示
(setq show-paren-style 'expression)
;; フェイスを変更する
(set-face-background 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "yellow")

;; スペースとタブを可視化
(require 'jaspace)
(setq jaspace-alternate-jaspace-string "□")
(setq jaspace-alternate-eol-string "↓\n")
(setq jaspace-highlight-tabs t)  ; highlight tabs
(setq jaspace-highlight-tabs ?^)
;; 各種 major mode で有効に
(setq jaspace-modes (append jaspace-modes
                            (list
                             'php-mode
                             'ruby-mode
                             'yaml-mode
                             'javascript-mode
                             'text-mode
                             )))
(add-hook 'mmm-mode-hook 'jaspace-mmm-mode-hook) ;; mmm-mode で有効に

;; デフォルトのタブサイズをスペース4つに
(setq-default tab-width 4 indent-tabs-mode nil)

;;C言語のインデント幅をスペース4つに
( setq c-mode-hook
'( lambda ()
( c-set-style "stroustrup" )
( setq c-basic-offset 4 )
))

;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b14770")

;; MacのCommandキーをMetaキーとして使う
(when (eq system-type 'darwin)
  (setq ns-command-modifier (quote meta))
  (setq ns-alternate-modifier (quote super))
)

;; 円マークの代わりにバックスラッシュを入力する
(define-key global-map [?¥] [?\\])
;; C-hをバックスペースに割り当て
(keyboard-translate ?\C-h ?\C-?)
;; 折り返しトグルコマンド
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)

;; color-themeの設定
(when (require 'color-theme nil t)
  ;; テーマを読み込むための設定
  (color-theme-initialize)
  ;; テーマ名
    (color-theme-billw)
;;  (color-theme-hober)
;;  (color-theme-taylor)
)

;; フェイスの設定
(defface my-hl-line-face
  ;; 背景がdarkならば背景を黒に
  '((((class color) (background dark))
     (:background "NavyBlue" t))
     ;; 背景がlightならば背景色を緑に
     (((class color) (background light))
      (:background "LightGoldenrodYellow" t))
     (t (:bold t)))
   "hl-line's my face")
(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode t)

;; フォントの設定
;;(set-default-font "Inconsolata-14:spacing=0")
;; (set-face-font 'variable-pitch "Inconsolata-14:spacing=0")
;;(set-fontset-font (frame-parameter nil 'font)
;;                  'japanese-jisx0208
;;                  '("Takaoゴシック-14:spacing=0" . "unicode-bmp")
;;)
(set-default-font "ricky-14:spacing=0")
(set-face-font 'variable-pitch "ricky-14:spacing=0")
 
;;================================
;; Shellの設定
;; zshを使う
(setq shell-file-name "/bin/zsh")

;;================================
;; 言語設定とか
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;;================================
;; ファイル名の扱い
;; Mac OS X
(when (eq system-type 'darwin)
  (require 'ucs-normalize)
  (set-file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))
;; Windows
(when (eq system-type 'w32)
  (set-file-name-coding-system 'cp932)
  (setq locale-coding-system 'cp932))

;;================================
;; 起動時のフレームサイズ
(setq initial-frame-alist
  (append (list
    '(width . 170)
    '(height . 50)
    '(top . 0)
    '(left . 0)
  )
  initial-frame-alist))
(setq default-frame-alist initial-frame-alist)

;; フレームの透明度
(set-frame-parameter nil 'alpha 85)

;; 行番号を表示
(global-linum-mode)
(setq linum-format "%5d");

;; beepを消す
(setq ring-bell-function 'ignore)

;; 終了時に聞く
(setq confirm-kill-emacs 'y-or-n-p)

;; スタートアップメッセージを非表示
(setq inhibit-startup-screen t)

;; scratchの初期メッセージ消去
;;(setq initial-scratch-message "")

;; モードラインにファイルサイズを表示
(size-indication-mode t)

;; モードラインに時計を表示
(setq display-time-day-and-date t) ; 曜日・月・日を表示
(setq display-time-24hr-format t) ; 24時間表示
(display-time-mode t)
 
;; メニューバーにファイルパスを表示
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))

;; 1秒以上操作しなかった場合にカーソルを点滅させる
(set-cursor-color "orange")
(setq blink-cursor-interval 0.7)
(setq blink-cursor-delay 1.0)
(blink-cursor-mode 1)

;;================================
;; cua-modeの設定
(cua-mode t) ; cua-modeをオン
(setq cua-enable-cua-keys nil) ;CUAキーバインドを無効にする

;;================================
;; clパッケージを読み込む
(require 'cl)
