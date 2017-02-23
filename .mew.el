;;______________________
; Mew
;;______________________

;;注意
;;imap(pop)サーバーを用いてメールを受け取るためにはgoogleアカウントの「ログインとセキュリティ」項目から安全性の低いアプリの許可を有効にしなければならない

; Stunnel (brew install stunnelコマンドでインストールしよう)
;;Load stnnel
(setq mew-prog-ssl "/usr/local/bin/stunnel")

; IMAP for Gmail

;(setq mew-proto "%")
;(setq mew-user "e135713@ie.u-ryukyu.ac.jp")
;(setq mew-user "tonkusu16@gmail.com")
;(setq mew-mail-domain "gmail.com")
;(setq mew-imap-server "imap.gmail.com")
;(setq mew-imap-user "e135713@ie.u-ryukyu.ac.jp")
;(setq mew-imap-user "tonkusu16@gmail.com")
;(setq mew-imap-auth t)
;(setq mew-imap-ssl t)
;(setq mew-imap-ssl-port "993")

; SMTP for Gmail

;(setq mew-smtp-auth t)(setq mew-smtp-ssl t)
;(setq mew-smtp-ssl-port "465")
;(setq mew-smtp-user "e135713@ie.u-ryukyu.ac.jp")
;(setq mew-smtp-user "tonkusu16@gmail.com")
;(setq mew-smtp-server "smtp.gmail.com")
;(setq mew-ssl-verify-level 0)
;(setq mew-use-cached-passwd t)
(setq mew-smtp-auth-list '("LOGIN" "CRAM-MD5" "PLAIN"))
(setq mew-config-alist
      '(("ext"
       (proto                   "%")
       (name                    "Tengan Hiroyuki")
       (user                    "tonkusu16")
       (mail-domain             "gmail.com")
       (dcc                     "tonkusu16@gmail.com")
       (protect-privacy-always  nil)
       (ssl-verify-level        0)
       ;; smtpサーバー
       (smtp-user               "tonkusu16@gmail.com")
       (smtp-auth               t)
       (smtp-ssl                t)
       (smtp-server             "smtp.gmail.com")
       (smtp-ssl-port           "465")
       ;; imapを使用する場合
       ("inbox-folder" . "+inbox-gmail")
       (imap-user               "tonkusu16@gmail.com")
       (imap-size               5242880) ; 5m以内即時受信する       
       (imap-auth               pass)
       (imap-ssl                t)
       (imap-ssl-port           "993")
       (imap-server             "imap.gmail.com"))
      ("default"
       (proto                   "%")
       (name                    "Tengan Hiroyuki")
       (user                    "e135713")
       (mail-domain             "gmail.com")
       (dcc                     "e135713@ie.u-ryukyu.ac.jp")
       (protect-privacy-always  nil)
       (ssl-verify-level        0)
       ;; smtpサーバー
       (smtp-user               "e135713@ie.u-ryukyu.ac.jp")
       (smtp-auth               t)
       (smtp-ssl                t)
       (smtp-server             "smtp.gmail.com")
       (smtp-ssl-port           "465")
       ;; imapを使用する場合
       ;;(inbox-folder            "%inbox")
       (imap-user               "e135713@ie.u-ryukyu.ac.jp")
       (imap-size               5242880) ; 5m以内即時受信する
       (imap-auth               pass)
       (imap-ssl                t)
       (imap-ssl-port           "993")
       (imap-server             "imap.gmail.com"))))

; SSL

;(setq mew-smtp-user "your name@gmail.com")
;(setq mew-ssl-verify-level 2)
;(setq mew-ssl-cert-directory "\nCAfile=/usr/local/share/cert/ca-root-nss.crt")
;(setq mew-imap-ssl t)
;(setq mew-smtp-ssl t)

(setq mew-fcc "%[Gmail]/騾∽ｿ｡貂医∩繝｡繝ｼ繝ｫ")
(setq mew-imap-trash-folder "%[Gmail]/trash")

