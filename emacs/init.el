;; init.el --- Emacs configuration

;; load all internal configs - hook makes sure they run last
(add-hook 'after-init-hook '(lambda ()
  (load "~/.emacs.d/config-internals.el")
))

(load "~/.emacs.d/add-repos.el") ;; loads additional package managers
(load "~/.emacs.d/add-remote-packages.el") ;; loads specific packages
(load "~/.emacs.d/add-local-packages.el") ;; loads packages downloaded manualy

;; run cofiguration for general packages
(load "~/.emacs.d/config-general.el") ;; configs python

;; run cofiguration for python - ELPy dependent configurations
(load "~/.emacs.d/config-python.el") ;; configs python

;; run configuration for latex
(load "~/.emacs.d/config-latex.el") ;; configs auctex



;; Configs at by Emacs-Gui
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages
;;    (quote
;;     (auctex py-autopep8 material-theme flycheck elpy ein better-defaults yasnippet))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-use-system-font t)
 '(package-selected-packages
   (quote
    (nconc impatient-mode yasnippet-classic-snippets projectile pdf-tools magit py-autopep8 material-theme flycheck elpy ein better-defaults auctex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "PfEd" :slant normal :weight normal :height 128 :width normal)))))
