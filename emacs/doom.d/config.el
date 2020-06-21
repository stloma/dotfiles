
; disable line numbers for orgmode only
; (add-hook 'org-mode-hook (lambda () (display-line-numbers-mode -1)))

; mac-command-modifier 'control)

(setq
  doom-font (font-spec :family "Courier" :size 15)
  doom-themes-enable-bold t
  doom-themes-enable-italic t
  doom-theme 'doom-one-light
  doom-leader-key ","
  display-line-numbers-type nil
  treemacs-width 25
  doom-themes-treemacs-theme "doom-colors")

(doom-themes-treemacs-config)
(doom-themes-org-config)

(map! :leader
      :desc "check spelling" "i s" #'ispell-word
      :desc "clear highlight" "<return>" #'evil-ex-nohighlight
      :desc "wrap text" "i w" #'org-fill-paragraph
      :desc "Jump to char" "c f" #'avy-goto-char
      :desc "Jump to line" "/ l" #'avy-goto-line)

;;
;; Orgmode settings
;;
(after! org

  (font-lock-add-keywords
    'org-mode
    '(("^ *\\([-]\\) "
      (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  (setq-default left-fringe-width 40)
  (setq
   ispell-program-name "/usr/local/bin/aspell"
   org-directory "~/org/"
   org-archive-location (concat org-directory "archive/%s::")
   org-bullets-bullet-list '("⁖" "✿" "✸")
   org-ellipsis " ▼ "
   org-todo-keywords '((type "☛ TODO" "⧗ INPROGRESS" "⚑ WAITING" "|" "✔ DONE" "✘ CANCELED" ))

   ;; Custom Agendas
   org-agenda-custom-commands
   '(("d" "My Daily View"
      ((tags "PRIORITY=\"A\""
             ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
              (org-agenda-overriding-header "High-priority unfinished tasks:")))
       (agenda ""
               ((org-agenda-skip-function '(org-agenda-skip-entry-if 'done))))
      (alltodo ""
               ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done 'scheduled 'deadline))
                (org-agenda-overriding-header "Unscheduled tasks")))))
     ("u" "Unscheduled tasks"
      ((alltodo ""
               ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done 'scheduled 'deadline))
                (org-agenda-overriding-header "Unscheduled tasks")))))
     ("r" "Recurring tasks"
      ((tags-todo "RECURRING"))))

   org-todo-keyword-faces
   '(("☛ TODO" :foreground "#50a14f")
     ("⧗ INPROGRESS" :foreground "#0098dd")
     ("⚑ WAITING" :foreground "#9f7efe")
     ("✘ CANCELED" :foreground "#ff6480")
     ("✔ DONE" :foreground "#7c7c75")))

  (custom-set-faces
   '(org-block ((t (:height 0.9))))
   '(org-document-info ((t (:height 0.9))))
   '(org-document-info-keyword ((t ( :height 0.9))))
   '(org-info-keyword ((t (:bold t :height 0.9))))
   '(org-level-1 ((t (:family "Linux Libertine O" :height 1.5 :weight ultra-light))))
   '(org-level-2 ((t (:weight normal))))
   '(org-level-4 ((t (:height 1.0))))
   '(org-meta-line ((t (:height 0.9))))
   '(org-quote ((t (:slant italic))))
   '(org-special-keyword ((t (:underline nil))))
   '(org-warning ((t (:bold nil))))))

(after! evil-org
  (remove-hook 'org-tab-first-hook #'+org-cycle-only-current-subtree-h))
