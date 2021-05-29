;;; init.el --- Emacs configuration
;;; Commentary:
;; First script executed when starting Emacs

;;; Code:
;; add internal configs in after-init-hook to make sure it runs last
(add-hook 'after-init-hook '(lambda ()
  (load "~/.emacs.d/config-internals.el")
))

;; loads additional package managers
(load "~/.emacs.d/add-repos.el")

;; loads remote packages (through package manager)
(load "~/.emacs.d/add-remote-packages.el")

;; loads packages downloaded manualy
(load "~/.emacs.d/add-local-packages.el")

;; runs cofiguration for general packages
(load "~/.emacs.d/config-general.el")

;; run cofiguration for python - ELPy dependent configurations
(load "~/.emacs.d/config-python.el") ;; configs python

;; run configuration for latex (and in general text-based documents)
(load "~/.emacs.d/config-latex.el") ;; configs auctex

;; run configuration for latex (and in general text-based documents)
(load "~/.emacs.d/config-docker.el") ;; configs auctex

;; Configs added by Emacs-Gui - added when you change something interactively from the menu
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-use-system-font t)
 '(package-selected-packages
	 (quote
		(docker yasnippet-snippets use-package py-autopep8 projectile pdf-tools material-theme markdown-mode magit impatient-mode flycheck elpy ein csv-mode better-defaults auctex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "PfEd" :slant normal :weight normal :height 128 :width normal)))))
