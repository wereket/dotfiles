;;; config.el -- Example Rational Emacs user customization file -*- lexical-binding: t; -*-
;; This file is generated from config.org. If you want to edit the
;; configuration, DO NOT edit config.el, edit config.org, instead.

;; Tangle the code blocks to config.el on save.
(defun org-babel-tangle-config ()
  (when (string-equal (buffer-file-name)
                      (expand-file-name "config.org" rational-config-path))
    ;; Dynamic scoping to the rescue
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))

(add-hook 'org-mode-hook
          (lambda ()
            (add-hook 'after-save-hook #'org-babel-tangle-config)))

(require 'rational-defaults)    ; Sensible default settings for Emacs
(require 'rational-use-package) ; Configuration for `use-package`
(require 'rational-updates)     ; Tools to upgrade Rational Emacs
(require 'rational-completion)  ; selection framework based on `vertico`
(require 'rational-ui)          ; Better UI experience (modeline etc.)
(require 'rational-windows)     ; Window management configuration
(require 'rational-editing)     ; Whitspace trimming, auto parens etc.
;(require 'rational-evil)        ; An `evil-mode` configuration
(require 'rational-org)         ; org-appear, clickable hyperlinks etc.
(require 'rational-project)     ; built-in alternative to projectile
(require 'rational-speedbar)    ; built-in file-tree
(require 'rational-screencast)  ; show current command and binding in modeline
(require 'rational-compile)     ; automatically compile some emacs lisp files
(require 'rational-clojure)     ; Clojure programming 
(require 'rational-elixir)      ; Elixir programming
(require 'rational-elm)
(require 'rational-erlang)

(custom-set-variables
   '(rational-ui-default-font
     '(:font "JetBrains Mono" :weight light :height 185)))

;;(rational-package-install-package 'doom-themes)
(load-theme 'modus-operandi t)

;; To not load `custom.el' after `config.el', uncomment this line.
;; (setq rational-load-custom-file nil)
