;; === [ KEYBINDINGS ] ===
;; (define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)
;; (define-key evil-normal-state-map (kbd "C-c") 'evil-normal-state)
(map! :nvi "C-c" 'evil-normal-state)

;; === [ OTHERS ] ===
(setq user-full-name "Alfonso Amoros"
      user-mail-address "alfonso.alfurtx@gmail.com")

;; === [ FONT ] ===
(setq doom-font (font-spec :family "Hack Nerd Font Mono" :size 16)
      doom-variable-pitch-font (font-spec :family "Hack Nerd Font Mono" :size 16)
      doom-big-font (font-spec :family "Hack Nerd Font Mono" :size 24))

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

;; === [ THEME ] ===
(setq doom-theme 'doom-one)

;; === [ ORG ] ===
(setq org-directory "~/org/")

;; === [ SETTINGS ] ===
(setq display-line-numbers-type nil)
(setq-default tab-width 4)
(setq-default evil-shift-width 4)
(setq fringe-mode 0)
(set-fringe-mode 0)
(set-frame-parameter nil 'internal-border-width 10)

;; === [ DIRED ] ===
(map! :leader
      (:prefix ("d" . "dired")
       :desc "Open dired" "d" #'dired
       :desc "Dired jump to current" "j" #'dired-jump)
      (:after dired
       (:map dired-mode-map
        :desc "Peep-dired image previews" "d p" #'peep-dired
        :desc "Dired view file" "d v" #'dired-view-file)))
;; Make 'h' and 'l' go back and forward in dired. Much faster to navigate the directory structure!
(evil-define-key 'normal dired-mode-map
  (kbd "M-RET") 'dired-display-file
  (kbd "h") 'dired-up-directory
  (kbd "l") 'dired-open-file ; use dired-find-file instead of dired-open.
  (kbd "m") 'dired-mark
  (kbd "t") 'dired-toggle-marks
  (kbd "u") 'dired-unmark
  (kbd "C") 'dired-do-copy
  (kbd "D") 'dired-do-delete
  (kbd "J") 'dired-goto-file
  (kbd "M") 'dired-chmod
  (kbd "O") 'dired-chown
  (kbd "P") 'dired-do-print
  (kbd "R") 'dired-rename
  (kbd "T") 'dired-do-touch
  (kbd "Y") 'dired-copy-filenamecopy-filename-as-kill ; copies filename to kill ring.
  (kbd "+") 'dired-create-directory
  (kbd "-") 'dired-up-directory
  (kbd "% l") 'dired-downcase
  (kbd "% u") 'dired-upcase
  (kbd "; d") 'epa-dired-do-decrypt
  (kbd "; e") 'epa-dired-do-encrypt)
;; If peep-dired is enabled, you will get image previews as you go up/down with 'j' and 'k'
(evil-define-key 'normal peep-dired-mode-map
  (kbd "j") 'peep-dired-next-file
  (kbd "k") 'peep-dired-prev-file)
(add-hook 'peep-dired-hook 'evil-normalize-keymaps)
;; Get file icons in dired
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
;; With dired-open plugin, you can launch external programs for certain extensions
;; For example, I set all .png files to open in 'sxiv' and all .mp4 files to open in 'mpv'
(setq dired-open-extensions '(("gif" . "sxiv")
                              ("jpg" . "sxiv")
                              ("png" . "sxiv")
                              ("mkv" . "mpv")
                              ("mp4" . "mpv")))
