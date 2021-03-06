;;; 45_auto-complete.el ---

;; auto-complete ポップアップメニューで自動補完
;; @see: http://cx4a.org/software/auto-complete/manual.ja.html
(global-auto-complete-mode t)
;; Maybe default-enable-multibyte-characters is t by default
(setq default-enable-multibyte-characters t)

;; @see: http://bitbucket.org/sakito/dot.emacs.d/src/047708c00326/site-start.d/init_ac.el
;; クイックヘルプが表示されるとバッファが大きく変更される場合があるので停止
(setq ac-use-quick-help nil)
;; キー設定
(define-key ac-completing-map (kbd "C-m") 'ac-complete)
(define-key ac-completing-map (kbd "C-j") 'ac-next)
(define-key ac-completing-map (kbd "C-k") 'ac-previous)
(define-key ac-completing-map (kbd "<C-tab>") 'ac-stop)
;; 補完候補が表示されている時に M-h を押すと即座にドキュメントが表示されるようにする
;; (define-key ac-completing-map (kbd "C-h") (lambda () (interactive) (ac-quick-help t))) だとダメ
(defun ac-quick-help-force ()
  (interactive)
  (ac-quick-help t))
(define-key ac-completing-map (kbd "C-h") 'ac-quick-help-force)

;; 補完対象のモードを追加
(when (boundp 'ac-modes)
  (setq ac-modes
        (append ac-modes
                (list 'd-mode 'yatex-mode 'matlab-mode
                      'gauche-mode 'scheme-mode 'ess-mode))))
;; 色の変更
(add-hook 'AC-mode-hook
          (set-face-background 'ac-selection-face "gray35"))

(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
