(deftheme casey-muratori-handmadehero
  "Created 2022-01-26.")

(custom-theme-set-faces
 'casey-muratori-handmadehero
 '(cursor ((t (:background "#40ff40"))))
 '(fixed-pitch ((t (:height 130 :foundry "SRC" :family "Liberation Mono"))))
 '(variable-pitch ((t (:height 130 :foundry "SRC" :family "Liberation Mono"))))
 '(escape-glyph ((t (:foreground "olive drab"))))
 '(homoglyph ((((background dark)) (:foreground "cyan")) (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
 '(minibuffer-prompt ((t (:foreground "burlywood3"))))
 '(highlight ((t (:background "burlywood3" :foreground "#161616"))))
 '(region ((t (:background "midnight blue"))))
 '(shadow ((t (:foreground "#5B6268"))))
 '(secondary-selection ((t (:extend t :background "#3f444a"))))
 '(trailing-whitespace ((t (:background "#ff6c6b"))))
 '(font-lock-builtin-face ((t (:foreground "#dab98f"))))
 '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-comment-face ((t (:foreground "gray50"))))
 '(font-lock-constant-face ((t (:foreground "olive drab"))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-function-name-face ((t (:foreground "burlywood3"))))
 '(font-lock-keyword-face ((t (:foreground "DarkGoldenrod3"))))
 '(font-lock-negation-char-face ((t (:inherit (bold default)))))
 '(font-lock-preprocessor-face ((t (:inherit default))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit (bold default)))))
 '(font-lock-regexp-grouping-construct ((t (:inherit (bold default)))))
 '(font-lock-string-face ((t (:foreground "olive drab"))))
 '(font-lock-type-face ((t (:foreground "DarkGoldenrod3"))))
 '(font-lock-variable-name-face ((t (:foreground "burlywood3"))))
 '(font-lock-warning-face ((t (:inherit (warning)))))
 '(button ((t (:inherit (link)))))
 '(link ((t (:foreground "burlywood3"))))
 '(link-visited ((default (:inherit (link))) (((class color) (background light)) (:foreground "magenta4")) (((class color) (background dark)) (:foreground "violet"))))
 '(fringe ((t (:foreground "#3f444a" :inherit (default)))))
 '(header-line ((t (:inherit (mode-line)))))
 '(tooltip ((t (:foreground "#bbc2cf" :background "#21242b"))))
 '(mode-line ((t (:box nil :foreground "#bbc2cf" :background "#1d2026"))))
 '(mode-line-buffer-id ((t (:weight bold))))
 '(mode-line-emphasis ((t (:foreground "#51afef"))))
 '(mode-line-highlight ((t (:inherit (highlight)))))
 '(mode-line-inactive ((t (:box nil :foreground "#5B6268" :background "#21242b"))))
 '(isearch ((t (:weight bold :inherit (lazy-highlight)))))
 '(isearch-fail ((t (:weight bold :foreground "#1B2229" :background "#ff6c6b"))))
 '(lazy-highlight ((t (:weight bold :inherit highlight))))
 '(match ((t (:weight bold :foreground "#98be65" :background "#1B2229"))))
 '(next-error ((t (:inherit (region)))))
 '(query-replace ((t (:inherit (isearch)))))
 '(company-tooltip ((t (:inherit default))))
 '(company-tooltip-selection ((t (:inherit highlight :weight bold))))
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#161616" :foreground "burlywood3" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "SRC" :family "Liberation Mono" :spacing 100)))))

(provide-theme 'casey-muratori-handmadehero)
