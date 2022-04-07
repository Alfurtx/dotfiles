;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CONFIG.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; FONTS
(setq doom-font (font-spec :family "Hack Nerd Font" :size 15)
      doom-variable-pitch-font (font-spec :family "Hack Nerd Font" :size 15)
      doom-big-font (font-spec :family "Hack Nerd Font" :size 24))

;; THEME
(setq doom-theme 'casey-muratori-handmadehero)
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
(setq-default line-spacing 0.25)
(global-subword-mode 1)
(setq doom-fallback-buffer-name "*dashboard*")

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

;; GOLDEN RATIO CONFIG
(use-package! golden-ratio
  :after-call pre-command-hook
  :config
  (golden-ratio-mode +1)
  ;; Using this hook for resizing windows is less precise than
  ;; `doom-switch-window-hook'.
  (remove-hook 'window-configuration-change-hook #'golden-ratio)
  (add-hook 'doom-switch-window-hook #'golden-ratio))

;; POPUP RULES
(set-popup-rule! "^\\*compilation\*" :side 'right :select t)

;; PROJECTILE
(setq projectile-project-search-path '("~/proyectos/"))

;; FORMATTER CONFIG
(setq +format-with-lsp nil)
(after! format
  (set-formatter! 'clang-format
    '("clang-format"
      "-style={ColumnLimit: 120, AlignEscapedNewlines: Left, BinPackArguments: false, BinPackParameters: false, AllowAllArgumentsOnNextLine: false, AllowShortFunctionsOnASingleLine: All, AllowShortEnumsOnASingleLine: true, AllowShortCaseLabelsOnASingleLine: false, SpaceAfterCStyleCast: true, PointerAlignment: Left, ReferenceAlignment: Right, BreakBeforeBraces: Allman, IndentWidth: 8, AlignAfterOpenBracket: Align, AlignArrayOfStructures: Right, AlignConsecutiveAssignments: Consecutive, AlignConsecutiveDeclarations: Consecutive, AlignConsecutiveBitFields: Consecutive, AllowShortBlocksOnASingleLine: Always, AlwaysBreakAfterReturnType: AllDefinitions}"
      ("-assume-filename=%S" (or buffer-file-name mode-result "")))
    ))

;; RANGER SETUP
(setq ranger-show-hidden t)

;; DASHBOARD CONFIG
(use-package dashboard
  :init      ;; tweak dashboard config before loading it
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-banner-logo-title "\nKEYBINDINGS:\
\nFind file               (SPC .)     \
Open buffer list    (SPC b i)\
\nFind recent files       (SPC f r)   \
Open the eshell     (SPC e s)\
\nOpen dired file manager (SPC d d)   \
List of keybindings (SPC h b b)")
  ;;(setq dashboard-startup-banner 'logo) ;; use standard emacs logo as banner
  (setq dashboard-startup-banner "~/.config/doom/doom-emacs-dash.png")  ;; use custom image as banner
  (setq dashboard-center-content nil) ;; set to 't' for centered content
  (setq dashboard-items '((recents . 5)
                          (agenda . 5 )
                          (bookmarks . 5)
                          (projects . 5)
                          (registers . 5)))
  :config
  (dashboard-setup-startup-hook)
  (dashboard-modify-heading-icons '((recents . "file-text")
                                    (bookmarks . "book"))))
