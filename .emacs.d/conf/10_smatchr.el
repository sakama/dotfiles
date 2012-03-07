;;================================
;; smartchr
(when (require 'smartchr nil t)
;;   (global-set-key (kbd "=") (smartchr '(" = " " == " "=")))
   (global-set-key (kbd ">") (smartchr '(">" " => " " => '`!!''" " => \"`!!'\"")))
   (global-set-key (kbd "{") (smartchr '("{ `!!' }" "{")))
)

