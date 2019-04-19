;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers

   '(
     csv
     php
     nginx
     ; checkers
     spell-checking
     syntax-checking

     ; completion
     auto-completion
     helm

     ; emacs
     better-defaults

     ; frameworks
     ruby-on-rails

     ; programming and markup languages
     clojure
     elixir
     emacs-lisp
     erlang
     go
     html
     javascript
     (markdown :variables markdown-live-preview-engine 'vmd)
     sql
     yaml
     react


     ; source control
     git
     github
     org

     ; tools
     shell
     )
   dotspacemacs-additional-packages '(
                                       evil-vimish-fold
                                       pretty-mode
                                      )
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))

(defun setup-indent (n)
  ;; java/c/c++
  (setq c-basic-offset n)
  ;; web development
  (setq coffee-tab-width n) ; coffeescript
  (setq javascript-indent-level n) ; javascript-mode
  (setq js-indent-level n) ; js-mode
  (setq js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq css-indent-offset n) ; css-mode
 )

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(spacemacs-dark)
   dotspacemacs-colorize-cursor-according-to-state t

   dotspacemacs-default-font '(("FuraCode Nerd Font Mono"
                                :size 16
                                :weight medium
                                :width normal
                                :powerline-scale 1.1)
                               ("Fira Code Symbol"
                                :size 16
                                :weight normal
                                :width normal
                                :powerline-scale 1.1))

   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'original
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers '(:relative nil
         :disabled-for-modes dired-mode
                             doc-view-mode
                             markdown-mode
                             org-mode
                             pdf-view-mode
                             text-mode
         :size-limit-kb 1000)
   dotspacemacs-folding-method 'origami
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  (setup-indent 2)
  (setq markdown-command "multimarkdown")
  (setq ruby-insert-encoding-magic-comment nil)
  (setq smerge-command-prefix "\C-cv")
)
(defun dotspacemacs/user-config ()
  (global-git-commit-mode t)

  ;; Font Ligatures
  (defun my-correct-symbol-bounds (pretty-alist)
    "Prepend a TAB character to each symbol in this alist,
  this way compose-region called by prettify-symbols-mode
  will use the correct width of the symbols
  instead of the width measured by char-width."
    (mapcar (lambda (el)
              (setcdr el (string ?\t (cdr el)))
              el)
            pretty-alist))

  (defun my-ligature-list (ligatures codepoint-start)
    "Create an alist of strings to replace with
  codepoints starting from codepoint-start."
    (let ((codepoints (-iterate '1+ codepoint-start (length ligatures))))
      (-zip-pair ligatures codepoints)))

  (setq my-fira-code-ligatures
        (let* ((ligs '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\"
                       "{-" "[]" "::" ":::" ":=" "!!" "!=" "!==" "-}"
                       "--" "---" "-->" "->" "->>" "-<" "-<<" "-~"
                       "#{" "#[" "##" "###" "####" "#(" "#?" "#_" "#_("
                       ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*"
                       "/**" "/=" "/==" "/>" "//" "///" "&&" "||" "||="
                       "|=" "|>" "^=" "$>" "++" "+++" "+>" "=:=" "=="
                       "===" "==>" "=>" "=>>" "<=" "=<<" "=/=" ">-" ">="
                       ">=>" ">>" ">>-" ">>=" ">>>" "<*" "<*>" "<|" "<|>"
                       "<$" "<$>" "<!--" "<-" "<--" "<->" "<+" "<+>" "<="
                       "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<" "<~"
                       "<~~" "</" "</>" "~@" "~-" "~=" "~>" "~~" "~~>" "%%"
                       "x" ":" "+" "+" "*")))
          (my-correct-symbol-bounds (my-ligature-list ligs #Xe100))))

  (defun my-set-fira-code-ligatures ()
    "Add fira code ligatures for use with prettify-symbols-mode."
    (setq prettify-symbols-alist
          (append my-fira-code-ligatures prettify-symbols-alist))
    (prettify-symbols-mode))

  (add-hook 'prog-mode-hook 'my-set-fira-code-ligatures)
  (add-hook 'org-mode-hook 'my-set-fira-code-ligatures)
  (add-hook 'text-mode-hook 'my-set-fira-code-ligatures))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(column-number-mode t)
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (pretty-mode spacemacs-theme js2-mode js-doc helm-css-scss haml-mode go-guru go-eldoc github-search github-clone github-browse-file gist gh marshal logito pcache ht transient emmet-mode company-web web-completion-data company-tern dash-functional tern company-go go-mode coffee-mode clojure-snippets clj-refactor edn multiple-cursors paredit peg lv cider-eval-sexp-fu cider sesman queue parseedn clojure-mode parseclj a vmd-mode csv-mode phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode nginx-mode flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip auto-dictionary xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help origami nlinum-relative nlinum org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download htmlize gnuplot erlang web-mode web-beautify tagedit sql-indent slim-mode scss-mode sass-mode pug-mode magit-gh-pulls livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor evil-vimish-fold vimish-fold yaml-mode unfill smeargle rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv projectile-rails rake inflections orgit ob-elixir mwim mmm-mode minitest markdown-toc markdown-mode magit-gitflow helm-gitignore helm-company helm-c-yasnippet gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flycheck-mix flycheck-credo flycheck feature-mode evil-magit magit magit-popup git-commit ghub with-editor company-statistics chruby bundler inf-ruby auto-yasnippet yasnippet alchemist company elixir-mode ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
