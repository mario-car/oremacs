;;; oremacs
;;* Base directory and load-path
(defvar emacs-d
  (file-name-directory
   (file-chase-links load-file-name))
  "The giant turtle on which the world rests.")
(setq ora-startup-time-tic (current-time))
(setq byte-compile-warnings '(cl-functions))
(let ((emacs-git (expand-file-name "git/" emacs-d)))
  (mapc (lambda (x)
          (add-to-list 'load-path (expand-file-name x emacs-git)))
        (delete "." (delete ".." (directory-files emacs-git)))))
(add-to-list 'load-path (expand-file-name "git/org-mode/lisp/" emacs-d))
(add-to-list 'load-path emacs-d)
(add-to-list 'load-path (expand-file-name "modes/" emacs-d))
(add-to-list 'load-path (expand-file-name "personal/" emacs-d))
(add-to-list 'load-path (expand-file-name "personal/modes/" emacs-d))
(setq enable-local-variables :all)
;;* straight.el
(if t
    (require 'ora-straight)
  (setq package-user-dir (expand-file-name "elpa" emacs-d))
  (when (< emacs-major-version 27)
    (package-initialize)))
;;* Font
(require 'ora-fonts)
;;* Customize
(defmacro csetq (variable value)
  `(funcall (or (get ',variable 'custom-set) 'set-default) ',variable ,value))
(defun ora-advice-add (&rest args)
  (when (fboundp 'advice-add)
    (apply #'advice-add args)))
;;** decorations
(csetq tool-bar-mode nil)
(csetq menu-bar-mode nil)
(csetq scroll-bar-mode nil)
(csetq truncate-lines t)
(csetq inhibit-startup-screen t)
(setq-default initial-scratch-message
              (concat ";; Happy hacking " user-login-name "!\n\n"))
(csetq text-quoting-style 'grave)
(csetq line-number-display-limit-width 2000000)
;;** navigation within buffer
(csetq next-screen-context-lines 5)
(csetq recenter-positions '(top middle bottom))
;;** finding files
(csetq vc-follow-symlinks t)
(csetq find-file-suppress-same-file-warnings t)
(csetq read-file-name-completion-ignore-case t)
(csetq read-buffer-completion-ignore-case t)
(prefer-coding-system 'utf-8)
;;** minibuffer interaction
(csetq enable-recursive-minibuffers t)
(setq minibuffer-message-timeout 1)
(minibuffer-depth-indicate-mode 1)
(csetq read-quoted-char-radix 16)
;;** editor behavior
(csetq load-prefer-newer t)
(csetq indent-tabs-mode nil)
(csetq ring-bell-function 'ignore)
(csetq highlight-nonselected-windows nil)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq kill-buffer-query-functions nil)
(add-hook 'server-switch-hook 'raise-frame)
(defadvice set-window-dedicated-p (around no-dedicated-windows activate))
;; http://debbugs.gnu.org/cgi/bugreport.cgi?bug=16737
(setq x-selection-timeout 10)
;; improves copying from a ssh -X Emacs.
(setq x-selection-timeout 100)
(require 'whicher)
(csetq lpr-command (whicher "gtklp"))
;;** internals
(csetq gc-cons-threshold (* 10 1024 1024))
(csetq ad-redefinition-action 'accept)
;;** time display
(csetq display-time-24hr-format t)
(csetq display-time-default-load-average nil)
(csetq display-time-format "")
;;** Rest
(csetq browse-url-browser-function 'browse-url-firefox)
(csetq browse-url-firefox-program (whicher "firefox"))
;; bind super key to other than windows key
(define-key function-key-map (kbd "<Scroll_Lock>") 'event-apply-super-modifier)
;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;;*** Backups
(setq backup-by-copying t)
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions t)
(setq version-control t)
(setq create-lockfiles nil)
;;* Bootstrap
;;** autoloads
(load (concat emacs-d "loaddefs.el") nil t)
(load (concat emacs-d "personal/loaddefs.el") t t)
;;** enable features
(mapc (lambda (x) (put x 'disabled nil))
      '(erase-buffer upcase-region downcase-region
        dired-find-alternate-file narrow-to-region))
;;** package.el
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "http://elpa.gnu.org/packages/")))
(setq package-pinned-packages '((yasnippet . "gnu")))
(let ((file-name-handler-alist nil))
  (require 'eclipse-theme)
  (load-theme 'eclipse t)
  (require 'use-package)
  (require 'smex)
  (require 'warnings))
;;* Modes
;;** global minor modes
(global-auto-revert-mode 1)
(setq auto-revert-verbose nil)
(winner-mode 1)
(remove-hook 'minibuffer-setup-hook 'winner-save-unconditionally)
(use-package recentf
  :config
  (setq recentf-exclude '("COMMIT_MSG" "COMMIT_EDITMSG" "github.*txt$"
                          "[0-9a-f]\\{32\\}-[0-9a-f]\\{32\\}\\.org"
                          ".*png$" ".*cache$"))
  (setq recentf-max-saved-items 600))
(eval-after-load 'xref
  '(progn
    (setq xref-pulse-on-jump nil)
    (setq xref-after-return-hook nil)))
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(use-package diminish)
(require 'ora-ivy)
(setq hippie-expand-verbose nil)
(blink-cursor-mode -1)
(add-to-list 'auto-mode-alist '("\\.tex\\'" . TeX-latex-mode))
(add-to-list 'auto-mode-alist '("\\.\\(?:a\\|so\\)\\'" . elf-mode))
(autoload 'mu4e "ora-mu4e")
(autoload 'mu4e-compose-new "ora-mu4e")
(add-to-list 'auto-mode-alist '("\\.cache\\'" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.\\(h\\|inl\\)\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cl\\'" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\(stack\\(exchange\\|overflow\\)\\|superuser\\|askubuntu\\|reddit\\|github\\)\\.com[a-z-._0-9]+\\.txt" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.org_archive\\'" . org-mode))
(add-to-list 'auto-mode-alist '("trace.txt\\'" . compilation-mode))
(add-to-list 'auto-mode-alist '("user.txt\\'" . conf-mode))
(add-to-list 'auto-mode-alist '("tmp_github.com" . markdown-mode))
;;** major modes
(use-package cmake-mode
  :mode "CMakeLists\\.txt\\'")
(use-package clojure-mode
  :mode ("\\.clj\\'" . clojure-mode))
(use-package eltex
  :mode ("\\.elt\\'" . eltex-mode))
(use-package j-mode
  :mode ("\\.j\\'" . j-mode))
(use-package octave
  :interpreter ("octave" . octave-mode))
;;* Use Package
;;** expansion
(use-package tiny
  :commands tiny-expand)
(use-package yasnippet
  :diminish yas-minor-mode
  :config
  (progn
    (setq yas-after-exit-snippet-hook '((lambda () (yas-global-mode -1))))
    (setq yas-fallback-behavior 'return-nil)
    (setq yas-triggers-in-field t)
    (setq yas-verbosity 0)
    (setq yas-snippet-dirs (list (concat emacs-d "snippets/")))
    (define-key yas-minor-mode-map [(tab)] nil)
    (define-key yas-minor-mode-map (kbd "TAB") nil)
    (add-to-list 'warning-suppress-types '(yasnippet backquote-change))))
(use-package auto-yasnippet
  :commands aya-create aya-open-line)
(use-package iedit
  :commands iedit-mode
  :config (progn
            (setq iedit-log-level 0)
            (define-key iedit-mode-keymap "\C-h" nil)
            (define-key iedit-lib-keymap "\C-s" 'iedit-next-occurrence)
            (define-key iedit-lib-keymap "\C-r" 'iedit-prev-occurrence))
  :init (setq iedit-toggle-key-default nil))
;;** completion
(use-package auto-complete
  :commands auto-complete-mode
  :config
  (progn
    (require 'auto-complete-config)
    (setq ac-delay 0.4)
    (define-key ac-complete-mode-map "\C-j" 'newline-and-indent)
    (define-key ac-complete-mode-map [return] nil)
    (define-key ac-complete-mode-map (kbd "M-TAB") nil)))
(require 'ora-company)
;;** keys
(use-package centimacro
  :commands centi-assign)
(require 'keys)
;;** appearance
(when (image-type-available-p 'xpm)
  (use-package powerline
    :config
    (setq powerline-display-buffer-size nil)
    (setq powerline-display-mule-info nil)
    (setq powerline-display-hud nil)
    (when (display-graphic-p)
      (powerline-default-theme)
      (remove-hook 'focus-out-hook 'powerline-unset-selected-window))))
(use-package uniquify
  :init
  (setq uniquify-buffer-name-style 'reverse)
  (setq uniquify-separator "/")
  (setq uniquify-ignore-buffers-re "^\\*"))
;;** rest
(require 'ora-avy)
(require 'ora-bookmark)
(require 'ora-hydra)
(require 'hooks)
(require 'ora-elisp)
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (lispy-flet (process-list ()) ad-do-it))
(setq confirm-kill-processes nil)
(defadvice custom-theme-load-confirm (around no-query-safe-thme activate)
  t)
(use-package dired
  :commands dired
  :config (setq dired-listing-switches
                (if (memq system-type '(windows-nt darwin))
                    "-alh"
                  "-laGh1v --group-directories-first")))
(use-package dired-x
  :commands dired-jump)
(use-package helm-j-cheatsheet
  :commands helm-j-cheatsheet)
(use-package pamparam
  :commands pamparam-drill)
(use-package helm-make
  :commands (helm-make helm-make-projectile)
  :config (setq helm-make-completion-method 'ivy))
(setq abbrev-file-name (expand-file-name "personal/lists/abbrev_defs" emacs-d))
(use-package flyspell
  :commands flyspell-mode
  :config (require 'ora-flyspell))
(use-package projectile
  :diminish projectile-mode
  :init
  (setq projectile-mode-line nil)
  (projectile-global-mode)
  (setq projectile-project-root-files-bottom-up
        '(".git" ".projectile"))
  (setq projectile-completion-system 'ivy)
  (setq projectile-indexing-method 'alien)
  (setq projectile-enable-caching nil)
  (setq projectile-verbose nil)
  (setq projectile-do-log nil)
  (setq projectile-switch-project-action
        (lambda ()
          (dired (projectile-project-root))))
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))
(use-package find-file-in-project
  :commands find-file-in-project)

;; Package `transient' is the interface used by Magit to display
;; popups.
(use-package transient
  :config

  ;; Allow using `q' to quit out of popups, in addition to `C-g'. See
  ;; <https://magit.vc/manual/transient.html#Why-does-q-not-quit-popups-anymore_003f>
  ;; for discussion.
  (transient-bind-q-to-quit))

;; Package `magit' provides a full graphical interface for Git within
;; Emacs.
(use-package magit
  :bind (;; This is the primary entry point for Magit. Binding to C-x
         ;; g is recommended in the manual:
         ;; https://magit.vc/manual/magit.html#Getting-Started
         ("C-x g" . #'magit-status)
         ;; Alternate transient entry point; binding recommended in
         ;; <https://magit.vc/manual/magit.html#Transient-Commands>.
         ("C-x M-g" . #'magit-dispatch)
         ;; Completing the trio of bindings in `magit-file-mode-map'.
         ("C-c M-g" . #'magit-file-dispatch))

  :init

  ;; Suppress the message we get about "Turning on
  ;; magit-auto-revert-mode" when loading Magit.
  (setq magit-no-message '("Turning on magit-auto-revert-mode..."))

  :config

  ;; Don't try to save unsaved buffers when using Magit. We know
  ;; perfectly well that we need to save our buffers if we want Magit
  ;; to see them.
  (setq magit-save-repository-buffers nil)

  (transient-append-suffix
    'magit-merge "-n"
    '("-u" "Allow unrelated" "--allow-unrelated-histories"))

  (transient-append-suffix 'magit-pull "-r"
    '("-a" "Autostash" "--autostash"))

  (transient-append-suffix 'magit-fetch "-t"
    '("-u" "Unshallow" "--unshallow")))

(use-package compile
  :diminish compilation-in-progress
  :config
  (setq compilation-ask-about-save nil)
  (assq-delete-all 'compilation-in-progress mode-line-modes))
(use-package htmlize
  :commands htmlize-buffer)
(lispy-mode)
(require 'personal-init nil t)
(unless (bound-and-true-p ora-barebones)
  (run-with-idle-timer
   3 nil
   (lambda () (require 'ora-org))))
(use-package elf-mode
  :commands elf-mode
  :init
  (add-to-list 'magic-mode-alist (cons "ELF" 'elf-mode)))
(use-package expand-region
  :bind ("C-=" . er/expand-region))
(use-package avy-zap
  :bind (("M-z" . avy-zap-to-char-dwim)
         ("M-Z" . avy-zap-up-to-char-dwim)))
(use-package beacon
  :config
  (setq-default beacon-lighter "")
  (setq-default beacon-size 20)
  (setq-default beacon-color "#DC143C")
  (beacon-mode 1))
(use-package fullframe
  :config
  (fullframe magit-status magit-mode-quit-window))
;; Package `helpful' provides a complete replacement for the built-in
;; Emacs help facility which provides much more contextual information
;; in a better format.ff
(use-package helpful
  :bind (;; Remap standard commands.
         ([remap describe-function] . #'helpful-callable)
         ([remap describe-variable] . #'helpful-variable)
         ([remap describe-symbol]   . #'helpful-symbol)
         ([remap describe-key]      . #'helpful-key)

         ;; Suggested bindings from the documentation at
         ;; https://github.com/Wilfred/helpful.
         :map help-map
         ("F" . #'helpful-function)
         ("M-f" . #'helpful-macro)
         ("C" . #'helpful-command)
         :map global-map
         ("C-c C-d" . #'helpful-at-point)))
(use-package visual-regexp
  :bind (([remap query-replace] . #'vr/query-replace)))
(use-package which-key
  :config
  ;; We configure it so that `which-key' is triggered by typing C-h
  ;; during a key sequence (the usual way to show bindings). See
  ;; <https://github.com/justbur/emacs-which-key#manual-activation>.
  (setq which-key-show-early-on-C-h t)
  (setq which-key-idle-delay most-positive-fixnum)
  (setq which-key-idle-secondary-delay 1e-100)
  (which-key-mode +1)
  :diminish which-key-mode)


(add-to-list 'warning-suppress-types '(undo discard-info))
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))
(ora-advice-add 'semantic-idle-scheduler-function :around #'ignore)
(require 'server)
(setq ora-startup-time-toc (current-time))
(or (server-running-p) (server-start))
(setq ora-startup-time-seconds
      (time-to-seconds (time-subtract ora-startup-time-toc ora-startup-time-tic)))
