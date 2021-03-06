;;; config.el -- Example Crafted Emacs user customization file -*- lexical-binding: t; -*-
;; This file is generated from config.org. If you want to edit the
;; configuration, DO NOT edit config.el, edit config.org, instead.

;; Tangle the code blocks to config.el on save.
(defun org-babel-tangle-config ()
  (when (string-equal (buffer-file-name)
                      (expand-file-name "config.org" crafted-config-path))
    ;; Dynamic scoping to the rescue
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))

(add-hook 'org-mode-hook
          (lambda ()
            (add-hook 'after-save-hook #'org-babel-tangle-config)))

(require 'crafted-defaults)    ; Sensible default settings for Emacs
(require 'crafted-use-package) ; Configuration for `use-package`
(require 'crafted-updates)     ; Tools to upgrade Crafted Emacs
(require 'crafted-completion)  ; selection framework based on `vertico`
(require 'crafted-ui)          ; Better UI experience (modeline etc.)
(require 'crafted-windows)     ; Window management configuration
(require 'crafted-editing)     ; Whitspace trimming, auto parens etc.
;(require 'crafted-evil)        ; An `evil-mode` configuration
(require 'crafted-org)         ; org-appear, clickable hyperlinks etc.
(require 'crafted-project)     ; built-in alternative to projectile
(require 'crafted-speedbar)    ; built-in file-tree
(require 'crafted-screencast)  ; show current command and binding in modeline
(require 'crafted-compile)     ; automatically compile some emacs lisp files
(require 'crafted-markup)      ; markup language settings
(require 'crafted-ide)         ; IDE config
(require 'crafted-cc++)        ; CC++ development
(require 'crafted-lisp)        ; Lisp development
(require 'crafted-ocaml)       ; Ocaml development
(require 'crafted-python)      ; Python development
(require 'crafted-elm)         ; Elm development
(require 'crafted-elixir)      ; Elixir development
(require 'crafted-erlang)      ; Erlang development
(require 'crafted-ess)         ; statistics development
(require 'crafted-java)        ; Java development
(require 'crafted-go)          ; Go development
(require 'crafted-rust)        ; Rust development

(add-hook 'emacs-startup-hook
          (lambda ()
            (custom-set-faces
             `(default ((t (:font "JetBrains Mono Light 18"))))
             `(fixed-pitch ((t (:inherit (default)))))
             `(fixed-pitch-serif ((t (:inherit (default)))))
             `(variable-pitch ((t (:font "Source Sans Pro 18")))))))

(crafted-package-install-package 'doom-themes)
(progn
  (disable-theme 'deeper-blue)          ; first turn off the deeper-blue theme
  (load-theme 'modus-operandi t))       ; load the doom-palenight theme

(use-package dirvish
  :ensure t
  :init
  ;; Let Dirvish take over Dired globally
  (dirvish-override-dired-mode))

;; To not load `custom.el' after `config.el', uncomment this line.
;; (setq crafted-load-custom-file nil)
