;; === [ KEYBINDINGS ] ===
;; (define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)
;; (define-key evil-normal-state-map (kbd "C-c") 'evil-normal-state)
(map! :nvi "C-c" 'evil-normal-state)

;; === [ OTHERS ] ===
(setq user-full-name "Alfonso Amoros"
      user-mail-address "alfonso.alfurtx@gmail.com")

;; === [ THEME ] ===
(setq doom-theme 'doom-one)

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

;; === [ FONT ] ===
(setq doom-font (font-spec :family "Hack Nerd Font" :size 16)
      doom-variable-pitch-font (font-spec :family "Hack Nerd Font" :size 16)
      doom-big-font (font-spec :family "Hack Nerd Font" :size 24))
(custom-set-faces!
  '(font-lock-keyword-face :weight bold)
  '(font-lock-comment-face :slant italic))

;; === [ ORG ] ===
(setq org-directory "~/org/")

;; === [ SETTINGS ] ===
(setq display-line-numbers-type nil)
(setq-default tab-width 4)
(setq-default evil-shift-width 4)
(setq line-spacing 0.40)
(fringe-mode '0)
(after! git-gutter-fringe
  (fringe-mode '0))
(set-frame-parameter nil 'internal-border-width 10)
(setq auto-save-default t
      make-backup-files t
      confirm-kill-emacs nil)
