;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CONFIG.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; FONTS
(setq doom-theme 'casey-muratori-handmadehero)
(setq doom-font (font-spec :family "Liberation Mono" :spacing 100 :size 16.5)
      doom-variable-pitch-font (font-spec :family "Liberation Mono" :spacing 100 :size 16.5)
      doom-big-font (font-spec :family "Liberation Mono" :size 24))

;; THEME
(global-hl-line-mode 1)
(custom-set-faces! '(hl-line :background "midnight blue"))
(setq fixme-modes '(c++-mode c-mode emacs-lisp-mode))
(make-face 'font-lock-fixme-face)
(make-face 'font-lock-note-face)
(mapc (lambda (mode)
        (font-lock-add-keywords
         mode
         '(("\\<\\(TODO\\)" 1 'font-lock-fixme-face t)
           ("\\<\\(NOTE\\)" 1 'font-lock-note-face t))))
      fixme-modes)
(modify-face 'font-lock-fixme-face "Red" nil nil t nil t nil nil)
(modify-face 'font-lock-note-face "Dark Green" nil nil t nil t nil nil)
(after! cc-mode
  (remove-hook 'c-mode-common-hook #'rainbow-delimiters-mode))
(setq cursor-type 'box)

;; GENERAL SETTINGS
(setq display-line-numbers-type nil)
(setq confirm-kill-emacs nil)
(setq user-full-name "Alfonso Amorós" user-mail-address "alfonso.alfurtx@gmail.com")
;(setq-default line-spacing 0.25)
(global-subword-mode 1)
(setq doom-fallback-buffer-name "*dashboard*")
(setq scroll-margin 2)

;; KEYBINDINGS
(define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)
(define-key evil-visual-state-map (kbd "C-c") 'evil-normal-state)

;; DIRED
(setq dired-listing-switches "-alh --group-directories-first")

;; LSP CONFIG
(setq ccls-args (list (concat "-init={"
                              "  \"cache\":{"
                              "    \"directory\":"
                              "      \"" (getenv "HOME") "/.cache/ccls\""
                              "  }"
                              "}")))
(setq lsp-lens-enable nil)

;; DAP MODE CONFIGURATION
(setq dap-auto-configure-mode t)
(require 'dap-cpptools)

(map! :map dap-mode-map
      :leader
      :prefix ("d" . "debugger")
      ;; basics
      :desc "dap next"          "n" #'dap-next
      :desc "dap step in"       "i" #'dap-step-in
      :desc "dap step out"      "o" #'dap-step-out
      :desc "dap continue"      "c" #'dap-continue
      :desc "dap hydra"         "h" #'dap-hydra
      :desc "dap debug restart" "r" #'dap-debug-restart
      :desc "dap debug"         "s" #'dap-debug

      ;; debug
      :prefix ("dd" . "Debug")
      :desc "dap debug recent"  "r" #'dap-debug-recent
      :desc "dap debug last"    "l" #'dap-debug-last

      ;; eval
      :prefix ("de" . "Eval")
      :desc "eval"                "e" #'dap-eval
      :desc "eval region"         "r" #'dap-eval-region
      :desc "eval thing at point" "s" #'dap-eval-thing-at-point
      :desc "add expression"      "a" #'dap-ui-expressions-add
      :desc "remove expression"   "d" #'dap-ui-expressions-remove

      :prefix ("db" . "Breakpoint")
      :desc "dap breakpoint toggle"      "b" #'dap-breakpoint-toggle
      :desc "dap breakpoint condition"   "c" #'dap-breakpoint-condition
      :desc "dap breakpoint hit count"   "h" #'dap-breakpoint-hit-condition
      :desc "dap breakpoint log message" "l" #'dap-breakpoint-log-message)

;; GOLDEN RATIO CONFIG
;; (use-package! golden-ratio
;;   :after-call pre-command-hook
;;   :config
;;   (golden-ratio-mode +1)
;;   ;; Using this hook for resizing windows is less precise than
;;   ;; `doom-switch-window-hook'.
;;   (remove-hook 'window-configuration-change-hook #'golden-ratio)
;;   (add-hook 'doom-switch-window-hook #'golden-ratio))

;; POPUP RULES
(set-popup-rule! "^\\*compilation\*" :side 'right :select t)

;; PROJECTILE
(setq projectile-project-search-path '("~/proyectos/"))

;; FORMATTER CONFIG
(setq +format-with-lsp nil)
(after! format
  (set-formatter! 'clang-format
    '("clang-format"
      "-style=file"
      ("-assume-filename=%S" (or buffer-file-name mode-result "")))
    ))

;; RANGER SETUP
(setq ranger-show-hidden t)
