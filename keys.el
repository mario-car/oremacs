;; keys -*- lexical-binding: t -*-
;;* Ctrl shortcuts
(global-set-key "\C-a" 'ora-move-beginning-of-line)      ; 'move-beginning-of-line
(global-set-key "\C-r" 'counsel-grep-or-swiper)          ; 'isearch-backward
(global-set-key "\C-s" 'swiper)                          ; 'isearch-forward
(global-set-key (kbd "C-z") 'capitalize-word-toggle)     ; capitili[z]e
(global-set-key (kbd "C-.") 'comment-dwim)
(global-set-key (kbd "C-,") 'lispy-kill-at-point)
(global-set-key (kbd "C-'") 'avy-goto-char-timer)
(global-set-key (kbd "C-\\") 'hydra-org-objects/body)
;;* Ctrl Meta shortcuts
(global-set-key (kbd "C-M-,") 'lispy-mark)
(global-set-key (kbd "C-M-q") 'ora-unfill-paragraph)
;; (global-set-key (kbd "C--") 'org-capture)
(global-set-key (kbd "C-:") 'ora-dired-jump)
(global-set-key (kbd "C->") 'upcase-word-toggle)
(global-set-key (kbd "C-<") 'rgrep)
(global-set-key (kbd "C-+") nil)
(global-set-key (kbd "<C-return>") nil)

;;* Meta shortcuts
(global-set-key (kbd "M-.") nil)
(global-set-key (kbd "M-m") 'lispy-mark-symbol)
(global-set-key (kbd "M-p") 'avy-pop-mark)
(global-set-key (kbd "M-i") 'iedit-mode)
(global-set-key (kbd "M-,") 'pop-tag-mark)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-y") 'counsel-yank-pop)

;;* Super shortcuts
(global-set-key (kbd "s-7") 'mc/mark-next-like-this)
(global-set-key (kbd "s-q") 'ora-single-quotes)
(global-set-key (kbd "s-w") 'aya-create)
(global-set-key (kbd "s-e") 'eval-expression)
(global-set-key (kbd "s-r") 'ora-eval-other-window)
(global-set-key (kbd "s-t") nil)
(global-set-key (kbd "s-y") 'aya-create)
(global-set-key (kbd "s-u") 'moo-jump-local)
(global-set-key (kbd "s-i") 'ora-ctrltab)
(global-set-key (kbd "s-o") 'ora-backward-delete-whitespace)
(global-set-key (kbd "s-p") nil)
(global-set-key (kbd "s-a") 'org-capture)
(global-set-key (kbd "s-f") nil)
(global-set-key (kbd "s-g") 'upcase-word-toggle)
(global-set-key (kbd "s-h") 'switch-to-buffer-other-window)
(global-set-key (kbd "s-j") 'ace-link)
(global-set-key (kbd "s-l") 'rgrep)
(global-set-key (kbd "s-z") nil)
(global-set-key (kbd "s-x") nil)
(global-set-key (kbd "s-c") nil)
(global-set-key (kbd "s-v") nil)
(global-set-key (kbd "s-b") nil)
(global-set-key (kbd "s-n") 'ora-angles)
(global-set-key (kbd "s-m") 'headlong-bookmark-jump-other)
(global-set-key (kbd "s-k") 'hydra-k/body)
(global-set-key (kbd "s-Q") 'ora-quotes)
(global-set-key (kbd "s-R") 'ora-brackets)
(global-set-key (kbd "s-Y") 'aya-expand)
(global-set-key (kbd "s-U") 'universal-argument)
(global-set-key (kbd "s-I") 'hydra-avy/body)
(global-set-key (kbd "s-P") 'avy-goto-char)
(global-set-key (kbd "s-F") 'ora-parens)
(global-set-key (kbd "s-H") 'ora-save-and-switch-buffer)
(global-set-key (kbd "s-X") 'lispy-right)
(global-set-key (kbd "s-C") 'ora-braces)
(global-set-key (kbd "s-B") nil)
(global-set-key (kbd "s-N") 'ace-window)
(global-set-key (kbd "s-M") 'headlong-bookmark-jump)

;;* C-c shortcuts
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'counsel-bookmark)
(global-set-key (kbd "C-c c") (lambda () (interactive) (org-capture nil "t")))
(global-set-key (kbd "C-c d") 'counsel-descbinds)
(global-set-key (kbd "C-c e") 'mu4e)
(global-set-key (kbd "C-c f") 'elfeed)
(global-set-key (kbd "C-c F") 'counsel-org-file)
(global-set-key (kbd "C-c G") 'counsel-git)
(global-set-key (kbd "C-c g") 'ora-counsel-git)
(global-set-key (kbd "C-c h") 'hydra-apropos/body)
(global-set-key (kbd "C-c i") 'counsel-imenu)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c J") 'counsel-file-jump)
(global-set-key (kbd "C-c k") 'counsel-rg)
(global-set-key (kbd "C-c K") 'counsel-ag)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c m") 'counsel-linux-app)
(global-set-key (kbd "C-c n") 'counsel-fzf)
(global-set-key (kbd "C-c o") 'counsel-outline)
(global-set-key (kbd "C-c P") 'counsel-package)
(global-set-key (kbd "C-c r") 'isearch-backward)
(global-set-key (kbd "C-c s") 'isearch-forward-regexp)
(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "C-c t") 'counsel-load-theme)
(global-set-key (kbd "C-c u") 'swiper-all)
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c w") 'counsel-wmctrl)
(global-set-key (kbd "C-c x") nil)
(global-set-key (kbd "C-c y") 'pamparam-drill)
(global-set-key (kbd "C-c E") 'vc-ediff)
(global-set-key (kbd "C-c L") 'counsel-git-log)
(global-set-key (kbd "C-c D") 'ora-insert-date-from)
(global-set-key (kbd "C-c V") 'ivy-pop-view)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "C-c C-j") 'avy-resume)
(global-set-key (kbd "C-c .") 'org-time-stamp)
(global-set-key (kbd "C-c R") 'counsel-register)

;;* C-x shortcuts
(global-set-key (kbd "C-x C-r") (lambda () (interactive) (revert-buffer nil t)))
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-x C-l") 'locate)
(global-set-key (kbd "C-x m") 'mu4e-compose-new)
(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "C-x p") 'proced)
(global-set-key (kbd "C-x C-i") 'flyspell-correct-word-before-point)
;;* Functional keys shortcuts
(global-set-key (kbd "<f1> a") 'apropos)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-load-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> k") 'kill-buffer)
(global-set-key (kbd "<f2> o") (lambda () (interactive) (search-forward "\"" (line-end-position) t) (ffap)))
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "<f2> C-u") 'helm-ucs)
(global-set-key (kbd "<f2> j") 'counsel-set-variable)
(global-set-key [f5] 'helm-make)
(global-set-key [C-f5] 'compile)
(global-set-key [f6] 'cook)
(global-set-key [f7] 'winner-undo)
(global-set-key [C-f7] 'winner-redo)
(global-set-key [f8] 'bookmark-bmenu-list)
(global-set-key [C-f8] 'bookmark-set)
(global-set-key [f11] 'ora-org-clock-out)
(global-set-key [C-f11] 'org-clock-goto)
(global-set-key [f12] 'orfu-agenda-day)
(global-set-key [C-f12] 'orfu-agenda-quick)
(global-set-key (kbd "C-<f1>") (lambda () (interactive) (shell-command "setxkbmap ua")))
(global-set-key (kbd "C-<f2>") (lambda () (interactive) (shell-command "setxkbmap us;xmodmap ~/.Xmodmap")))
;;* Misc shortcuts
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(global-set-key (kbd "C-s-p") 'counsel-rhythmbox-playpause-current-song)

;;* Hydras
(require 'hydra-examples)
(defhydra hydra-error (global-map "M-g")
  "goto-error"
  ("h" first-error "first")
  ("j" next-error "next")
  ("k" previous-error "prev")
  ("v" recenter-top-bottom "recenter")
  ("q" nil "quit"))
(global-set-key (kbd "M-g g") 'avy-goto-line)
(global-set-key (kbd "C-M-g") 'avy-goto-line)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g s") 'avy-goto-subword-0)

(defhydra hydra-zoom (global-map "<f2>")
  "zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out")
  ("r" (text-scale-set 0) "reset")
  ("0" (text-scale-set 0) :bind nil :exit t)
  ("1" (text-scale-set 0) nil :bind nil :exit t))

(use-package define-word
  :commands define-word-at-point)

(use-package tea-time
  :config
  (setq tea-time-sound-command "play %s"))

(use-package cook
  :commands cook)

(defhydra hydra-k (:exit t :idle 0.8)
  "k"
  ("a" orfu-agenda-day "agenda")
  ("b" winner-undo "browse" :exit nil)
  ("c" (lambda () (interactive) (cook '(4))) "cook :")
  ("d" define-word-at-point "def")
  ("e" ora-ediff-dwim "ediff")
  ("f" ora-flyspell-previous-word "flyspell")
  ("j" dired-jump "dired")
  ("E" eval-expression "eval")
  ("m" hydra-pamparam/body "pamparam")
  ("R" counsel-recoll "recoll")
  ("r" (counsel-rhythmbox 1) "rhythmbox")
  ("o" ccc-toggle-header-source "other")
  ("G" ora-github "github")
  ("g" counsel-search "incremental search")
  ("p" ora-project "project")
  ("s" hydra-search/body "search")
  ("n" ora-open-wikitionary "wikitionary")
  ("N" ora-open-google-translate "google-translate")
  ("t" tea-time "tea")
  ("y" avy-copy-region "yank region")
  ("w" plain-org-wiki "wiki")
  ("W" ora-open-wikipedia "wikipedia")
  ("q" nil "quit"))

(autoload 'hydra-search/body "ora-search")

(defhydra hydra-toggle (:color pink :hint nil)
  "
_a_ abbrev-mode:       %`abbrev-mode
_d_ debug-on-error:    %`debug-on-error
_f_ auto-fill-mode:    %`auto-fill-function
_h_ highlight          %`highlight-nonselected-windows
_t_ truncate-lines:    %`truncate-lines
_w_ whitespace-mode:   %`whitespace-mode
_l_ org link display
"
  ("a" abbrev-mode)
  ("d" toggle-debug-on-error)
  ("e" evil-mode :exit t)
  ("f" auto-fill-mode)
  ("h" (setq highlight-nonselected-windows (not highlight-nonselected-windows)))
  ("t" toggle-truncate-lines)
  ("w" whitespace-mode)
  ("l" org-toggle-link-display)
  ("q" nil "quit"))

(global-set-key (kbd "C-c C-v") 'hydra-toggle/body)

(defhydra hydra-window (:color red
                        :columns nil)
  "window"
  ("h" windmove-left nil)
  ("j" windmove-down nil)
  ("k" windmove-up nil)
  ("l" windmove-right nil)
  ("H" hydra-move-splitter-left nil)
  ("J" hydra-move-splitter-down nil)
  ("K" hydra-move-splitter-up nil)
  ("L" hydra-move-splitter-right nil)
  ("v" (lambda ()
         (interactive)
         (split-window-right)
         (windmove-right))
       "vert")
  ("x" (lambda ()
         (interactive)
         (split-window-below)
         (windmove-down))
       "horz")
  ("t" transpose-frame "'" :exit t)
  ("o" delete-other-windows "one" :exit t)
  ("a" ace-window "ace")
  ("s" ace-swap-window "swap")
  ("d" ace-delete-window "del")
  ("i" ace-maximize-window "ace-one" :exit t)
  ("b" ido-switch-buffer "buf")
  ("m" headlong-bookmark-jump "bmk")
  ("q" nil "cancel")
  ("u" (progn (winner-undo) (setq this-command 'winner-undo)) "undo")
  ("f" nil))

(defhydra hydra-apropos (:color blue
                         :hint nil)
  "
_m_an              _c_ommand
_a_propos          _l_ibrary
_d_ocumentation    _u_ser-option
_v_ariable     valu_e_"
  ("m" man)
  ("a" apropos)
  ("d" apropos-documentation)
  ("v" apropos-variable)
  ("c" apropos-command)
  ("l" apropos-library)
  ("u" apropos-user-option)
  ("e" apropos-value))
(global-set-key (kbd "C-M-o") 'hydra-window/body)
(global-set-key (kbd "s-K") 'hydra-pause-resume)
(global-set-key (kbd "s-M-k") 'ora-kill-current-buffer)
(global-set-key (kbd "C-M-y") 'counsel-hydra-heads)
(global-set-key (kbd "C-M-j") 'counsel-semantic)
(global-set-key (kbd "C-x SPC") 'hydra-rectangle/body)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-SPC") 'hydra-set-mark)
(global-set-key (kbd "C-SPC") 'set-mark-command)
(global-set-key (kbd "<down-mouse-3>") 'ora-open-file-at-point)
;; unbind 'mouse-buffer-menu
(global-set-key [C-down-mouse-1] 'ignore)

(defun hydra-set-mark ()
  (interactive)
  (if (region-active-p)
      (progn
        (deactivate-mark)
        (hydra-keyboard-quit))
    (call-interactively 'set-mark-command)
    (hydra-region/body)))

(defhydra hydra-region ()
  ("E" forward-sentence)
  ("f" forward-word)
  ("b" backward-word)
  ("w" kill-region :exit t))

(defhydra hydra-o (:exit t)
  "outl"
  ("o" aya-open-line)
  ("j" lispy-insert-outline-below)
  ;; ("j" zo-insert-outline-below)
  ("h" lispy-insert-outline-left)
  ("p" lispy-insert-prev-outline-body)
  ("C-o" nil nil))
(hydra-set-property 'hydra-o :verbosity 1)

(defun lispy-insert-prev-outline-body ()
  (interactive)
  (save-excursion
    (insert
     (save-excursion
       (zo-up 1)
       (mapconcat
        'identity
        (cl-remove-if
         (lambda (s)
           (string-match-p "^;;" s))
         (split-string
          (string-trim
           (lispy--string-dwim
            (worf--bounds-subtree)))
          "\n"
          t))
        "\n")))))

(provide 'keys)
