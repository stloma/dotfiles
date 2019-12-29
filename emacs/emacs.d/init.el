(package-initialize)
                                        ; org format init file
;; (org-babel-load-file "~/.emacs.d/config.org")

;; package setup
(setq package-enable-at-startup nil)
(setq package-archives
      '(("elpa"     . "https://elpa.gnu.org/packages/")
        ("melpa"        . "https://melpa.org/packages/")))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(require 'use-package-ensure)

(setq use-package-always-ensure t)
(setq load-prefer-newer t)

;; options
(add-hook 'org-mode-hook '(lambda () (setq fill-column 80)))
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(menu-bar-mode -1)
(tool-bar-mode -1)
(save-place-mode 1)
(scroll-bar-mode -1)
(setq word-wrap t)
                                        ; Don't put a new line after org-meta-return
(setf org-blank-before-new-entry '((heading . nil) (plain-list-item . nil)))
(setq mac-command-modifier 'control)
(setq mac-allow-anti-aliasing t)
(setq vc-follow-symlinks t)
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq inhibit-startup-screen t)
(show-paren-mode 1)
(global-hl-line-mode)
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq org-return-follows-link t)

; (global-display-line-numbers-mode)
; (set-face-foreground 'line-number "#ffffff")
; (set-face-foreground 'line-number-current-line "#ffffff")
; (setq-default display-line-numbers-type 'relative
;               display-line-numbers-current-absolute t
;               display-line-numbers-width 3
;               display-line-numbers-widen t)

(setq-default left-fringe-width 40)

;; Appearance
;;
(set-face-attribute 'default nil :family "Courier" :height 170)
(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
                                        ; (load-theme 'doom-solarized-dark t)
  (doom-themes-neotree-config)
  (doom-themes-org-config))
(load-file "~/.emacs.d/themes/custom-theme.el")

                                        ; (use-package base16-theme
                                        ;   :ensure t
                                        ;   :config (load-theme 'base16-atelier-sulphurpool t))

;; Package loading and configuration
;;
(use-package org-bullets
  :commands org-bullets-mode
  :init
  (add-hook 'org-mode-hook 'org-bullets-mode)
  (setq org-bullets-bullet-list '("⁖" "✿" "✸")))

(use-package which-key
  :config
  (which-key-declare-prefixes ", b" "Buffers")
  (which-key-declare-prefixes ", c" "Clipboard")
  (which-key-declare-prefixes ", e" "Emacs")
  (which-key-declare-prefixes ", f" "Files")
  (which-key-declare-prefixes ", o" "Org")
  (which-key-declare-prefixes ", p" "Projectile")
  (which-key-declare-prefixes ", t" "Text")
  (which-key-declare-prefixes ", x" "Execute")
  (which-key-mode))

(use-package all-the-icons :ensure t)
(use-package ace-jump-mode :ensure t)

(use-package recentf
  :config
  (setq recentf-save-file (expand-file-name "recentf" "~/.emacs.d/")
        recentf-max-saved-items 500
        recentf-max-menu-items 15
        recentf-auto-cleanup 'never)
  (recentf-mode +1))

(use-package helm
  :init
  (setq helm-follow-mode-persistent t
        helm-prevent-escaping-from-minibuffer nil
        helm-display-header-line nil
        helm-autoresize-max-height 60
        helm-mini-default-sources '(helm-source-buffers-list
                                    helm-source-recentf
                                    helm-source-bookmarks
                                    helm-source-buffer-not-found)
        helm-boring-buffer-regexp-list '("\*.+\*"))
  :config
  (require 'helm-config)
  (helm-autoresize-mode t)
  (add-hook 'helm-minibuffer-set-up-hook 'helm-hide-minibuffer-maybe)
  (helm-mode t))

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t))

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on)

  (set-face-attribute 'helm-selection nil
                      :background "#d2ecff")
  (set-face-attribute 'helm-source-header nil
                      :box '(:style released-button)
                      :italic t
                      :height 1.1)
  (set-face-attribute 'helm-ff-file nil
                      :foreground "#383a41")
  (set-face-attribute 'helm-ff-dirs nil
                      :foreground "#383a41"))

(defun my-archive-when-done ()
  "Archive current entry if it is marked as DONE (see `org-done-keywords')."
  (interactive)
  (when (org-entry-is-done-p)
    (org-archive-subtree-default)))

(use-package evil-leader
  :ensure t
  :init
  (progn
    (global-evil-leader-mode)
    (evil-leader/set-leader ",")
    (evil-leader/set-key
      "bb" 'mode-line-other-buffer
      "bc" 'switch-to-buffer
      "bp" 'previous-buffer
      "bn" 'next-buffer
      "bk" 'kill-buffer
      "bm" 'helm-buffers-list
      "cl" 'helm-show-kill-ring
      "er" 'eval-buffer
      "ef" (lambda () (interactive) (find-file "~/.emacs.d/init.el"))
      "fb" 'helm-bookmarks
      "fm" 'helm-mini
      "ft" 'neotree-toggle
      "ff" 'helm-find-files
      "fr" 'ranger
      "fs" 'save-buffer
      "fS" 'save-some-buffers
      "oa" 'org-agenda
      "oA" 'my-archive-when-done
      "oc" 'org-capture
      "oi" (lambda () (interactive) (find-file "~/Dropbox/Notes/orgmode/agenda/inbox.org"))
      "os" 'org-sparse-tree
      "pi" 'projectile-invalidate-cache
      "pm" 'helm-projectile
                                        ; "tw" 'fill-paragraph
      "tc" 'ace-jump-char-mode
      "ti" 'org-toggle-inline-images
      "tl" 'ace-jump-line-mode
      "ts" 'ispell
      "tS" 'flyspell-mode
      "tw" 'fill-region
      "xl" 'helm-M-x
      "<return>" 'evil-ex-nohighlight
      "<SPC>" 'helm-projectile
      "<tab>" 'other-window)))

(use-package evil
  :init
  :config
  (setq
   evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes)
   evil-emacs-state-modes nil)
  (evil-select-search-module 'evile-search-module 'evil-search)
  (evil-mode 1))

(with-eval-after-load 'evil-maps
  (evil-define-key 'normal 'global (kbd "C-j") 'ace-jump-line-mode)
  (evil-define-key 'normal 'global (kbd "C-k") 'ace-jump-char-mode)
  (define-key evil-motion-state-map (kbd "SPC") nil)
  (define-key evil-motion-state-map (kbd "RET") nil)
  (define-key evil-motion-state-map (kbd "TAB") nil))

(use-package neotree
                                        ; :after all-the-icons
  :config
  (setq
   neo-theme (if (display-graphic-p) 'arrows)
   neo-smart-open t
   neo-window-width 20)
  (add-hook 'neo-after-create-hook
            (lambda (&rest_) (display-line-numbers-mode -1)))

  (face-spec-set 'neo-file-link-face '((t (:height .9))))
  (face-spec-set 'neo-dir-link-face '((t (:height .9))))

  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "o") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
  (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "c") 'neotree-create-node)
  (evil-define-key 'normal neotree-mode-map (kbd "r") 'neotree-rename-node)
  (evil-define-key 'normal neotree-mode-map (kbd "d") 'neotree-delete-node)
  (evil-define-key 'normal neotree-mode-map (kbd "j") 'neotree-next-line)
  (evil-define-key 'normal neotree-mode-map (kbd "k") 'neotree-previous-line)
  (evil-define-key 'normal neotree-mode-map (kbd "k") 'neotree-previous-line))


(require 'desktop)
(desktop-save-mode 1)
                                        ; (defun my-desktop-save ()
                                        ;   (interactive)
                                        ;   ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
                                        ;   (if (eq (desktop-owner) (emacs-pid))
                                        ;       (desktop-save desktop-dirname)))
; (add-hook 'auto-save-hook 'my-desktop-save)

(use-package org-wc)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq
   dashboard-items '((recents  . 5)
                     (bookmarks . 5)
                     (projects . 5)
                     (agenda . 5)
                     (registers . 5))
   dashboard-set-heading-icons t
   dashboard-set-file-icons t
   dashboard-set-navigator t
   show-week-agenda-p t
   dashboard-center-content t)
  (with-eval-after-load 'evil
    (evil-define-key 'normal dashboard-mode-map
      "g" 'dashboard-refresh-buffer
      "}" 'dashboard-next-section
      "{" 'dashboard-previous-section
      "p" 'dashboard-goto-projects
      "r" 'dashboard-goto-recent-files
      "H" 'browse-homepage
      "R" 'restore-session)))


(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))


(use-package flyspell
  :config
  (setq ispell-program-name "/usr/local/bin/aspell")
  (flyspell-mode t))


(with-eval-after-load 'org
  (define-key evil-normal-state-map (kbd "gh") 'outline-up-heading)
  (define-key evil-normal-state-map (kbd "gj") 'org-forward-heading-same-level)
  (define-key evil-normal-state-map (kbd "gk") 'org-backward-heading-same-level)
  (define-key evil-normal-state-map (kbd "gl") 'outline-next-visible-heading)

  (setq
   org-agenda-files (directory-files-recursively "~/Dropbox/Notes/org/" "\.org$")
   org-deadline-warning-days 0
   org-agenda-window-setup 'only-window
   org-archive-location (concat "~/Dropbox/Notes/org/agenda/archive/archive-"
    (format-time-string "%Y%m" (current-time)) ".org_archive::")
   org-default-notes-file "~/Dropbox/Notes/org/agenda/inbox.org"
   org-hide-emphasis-markers t
   org-log-done (quote time)
                                        ; org-ellipsis "↴"
                                        ; org-ellipsis "▾"
   org-ellipsis " ... "

   org-emphasis-alist
   (quote (("*" bold)
           ("/" italic)
           ("_" underline)
           ("=" (:foreground "#50a14f" :height 1.2))
           ("~" (:foreground "#a626a4" :weight bold))
           ("+" (:foreground "#823ff1" :strike-through nil))
           ))

   org-agenda-custom-commands
   '(("d" "My Daily View"
      ((tags "PRIORITY=\"A\""
             ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
              (org-agenda-overriding-header "High-priority unfinished tasks:")))
      (agenda "")
      (tags-todo "-RECURRING" ((org-agenda-overriding-header "Global non-recurring TODO items")))))
     ("u" "Unscheduled tasks"
      ((alltodo ""
               ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done 'scheduled 'deadline))
                (org-agenda-overriding-header "Unscheduled tasks")))))
     ("r" "Recurring tasks"
      ((tags-todo "RECURRING"))))

   org-todo-keywords '((type "☛ TODO" "⧗ INPROGRESS" "⚑ WAITING" "|" "✔ DONE" "✘ CANCELED" ))

   org-todo-keyword-faces
   '(("☛ TODO" :foreground "#50a14f")
     ("⧗ INPROGRESS" :foreground "#0098dd")
     ("⚑ WAITING" :foreground "#9f7efe")
     ("✘ CANCELED" :foreground "#ff6480")
     ("✔ DONE" :foreground "#7c7c75")))


  (font-lock-add-keywords
   'org-mode
   '(("^ *\\([-]\\) "
      (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•")))))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (which-key use-package org-bullets neotree helm-projectile evil-matchit evil-leader doom-themes doom-modeline deft base16-theme annalist ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-block ((t (:height 0.9))))
 '(org-block-begin-line ((t (:foreground "#996600" :background "#ffe6b3"))))
 '(org-block-end-line ((t (:foreground "#996600" :background "#ffe6b3"))))
 '(org-document-info ((t (:foreground: "#5e6687" :height 0.9))))
 '(org-document-info-keyword ((t (:foreground: "#5e6687" :height 0.9))))
 '(org-info-keyword ((t (:bold t :height 0.9))))
 '(org-level-1 ((t (:foreground "#1b2734" :family "Linux Libertine O" :height 1.5 :weight ultra-light))))
 '(org-level-2 ((t (:foreground "#1b2734" :weight normal))))
 '(org-level-4 ((t (:foreground "#1b2734" :height 1.0))))
 '(org-list-dt ((t (:foreground "#0098dd"))))
 '(org-meta-line ((t (:height 0.9))))
 '(org-quote ((t (:foreground "#2f4f4f" :background "#f0fef0" :slant italic))))
 '(org-special-keyword ((t (:foreground "#545454" :underline nil))))
 '(org-warning ((t (:foreground "#1b2734" :bold nil)))))
