(setq org-todo-keywords
      (quote (
              (sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
              (sequence "PROJECT(p)" "|" "DONE(d!/!)" "CANCELLED(c@/!)")
              (sequence "WAITING(w@/!)" "DELEGATED(e!)" "HOLD(h)" "|" "CANCELLED(c@/!)"))
             )
      org-todo-repeat-to-state "NEXT")
(setq org-todo-keyword-faces
      (quote (("NEXT" :inherit warning)
              ("PROJECT" :inherit font-lock-string-face)
              ;;("TODO" . (:foreground "white" :background "#95A5A6" :weight bold))
              ;;("DONE" . (:foreground "white" :background "#3498DB" :weight bold))
              ;;("HACK" . (:foreground "white" :background "#2E8B57" :weight bold))
              )))


;;; Org clock

;; Save the running clock and all clock history when exiting Emacs, load it on startup
(with-eval-after-load 'org
  (org-clock-persistence-insinuate))
(setq org-clock-persist t)
(setq org-clock-in-resume t)

;; Save clock data and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)
;; Save state changes in the LOGBOOK drawer
(setq org-log-into-drawer t)
;; Removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)

;; Show clock sums as hours and minutes, not "n days" etc.
(setq org-time-clocksum-format
      ;;'(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t)
      '("%Y-%m-%d %H:%M")
      )

(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   (seq-filter
    (lambda (pair)
      (featurep (intern (concat "ob-" (symbol-name (car pair))))))
    '((R . t)
      (ditaa . t)
      (dot . t)
      (emacs-lisp . t)
      (gnuplot . t)
      (haskell . nil)
      (latex . t)
      (ledger . t)
      (ocaml . nil)
      (octave . t)
      (plantuml . t)
      (python . t)
      (ruby . t)
      (screen . nil)
      (sh . t) ;; obsolete
      (shell . t)
      (sql . t)
      (sqlite . t)))))

;; 默认展开内容,貌似没用
(setq org-startup-folded nil)
;; 默认缩进内容, 隐藏标题栏里的一堆星号
(setq org-startup-indented t)
(setq org-ellipsis " ▾") ;; 收缩内容,将.....替换为倒三角
