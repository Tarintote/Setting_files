(add-to-list 'load-path "~/.emacs.d/site-lisp")
 ;; (normal-top-level-add-subdirs-to-load-path)

 ;; 環境に合わせた日本語文字コードに設定
 ;;  Windows => SJIS
 ;;  Linux => 環境変数 LANG から
 (set-language-environment "Japanese")

;; set-language-environment でうまくいかない場合に設定
;; (setq prefer-coding-system 'utf-8)

 ;; ターミナルの場合(window-system が nil)、
 ;; <backspace> が C-h になるので、 C-h で <delete> (C-?) が押されたことにする
 (unless window-system
   (keyboard-translate ?\C-h ?\C-?))
 ;; C-h 以外もヘルプキーに割り当て
 (global-set-key (kbd "M-?") 'help-command)

 (when (require 'auto-complete-config nil t)
   (ac-config-default))

;; 共通
;; ================================================================

;; 左端(文字の前)ではインデント、それ以外はタブの挿入
(setq tab-always-indent nil)
(setq c-tab-always-indent nil)
 
 ;; 空白を一度に削除
 (if (fboundp 'global-hungry-delete-mode)
     (global-hungry-delete-mode 1))
 
 ;; 改行時などに自動でインデント 
 ;;   (C-j と C-m の入れ替え)
 (if (fboundp 'electric-indent-mode)
     (electric-indent-mode 0))
 
 ;; 特定の文字を入力すると自動で改行、インデント
 ;; (electric-layout-mode 1)
 
 
 ;; C 系共通
 ;; ================================================================
 
 (defun my-all-cc-mode-init ()
   ;; C 系(cc-mode を継承した)モード共通の設定を記述
 
   ;; 空白などを一度に削除
   (c-toggle-hungry-state 1)
 
   ;; 改行時などで自動インデント
   ;; (c-toggle-electric-state 1)
   ;; 
   ;; ";", "}" などを入力したときに自動改行
   ;; 自動インデントも一緒に ON になる
   ;; (c-toggle-auto-newline 1)
 
   )
 (add-hook 'c-mode-common-hook 'my-all-cc-mode-init)

 ;; ビープ音禁止
 (setq ring-bell-function 'ignore)

 ;; スタート画面(メッセージ)を表示しない
 (setq inhibit-startup-screen t)

;; png, jpg などのファイルを画像として表示
 (setq auto-image-file-mode t)