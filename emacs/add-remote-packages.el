;; INSTALL PACKAGES
;; --------------------------------------

(defvar generalPackages
  '(
    use-package               ;; adds use-package macro for configuring packages in a tidy way
    simple-httpd              ;; simple emacs web server
    yasnippet                 ;; supports auto-complete snippets
    yasnippet-snippets        ;; list of common snippets
    projectile                ;; offers project-level manipulation (find etc)
    magit                     ;; git inside emacs
    markdown-mode             ;; edit markdowns from emacs
    impatient-mode            ;; live-preview of html in the browser (built on top of simple-httpd)
    ))

;; TODO add descriptions
(defvar pythonPackages
  '(better-defaults 
    ein
    elpy
    flycheck
    material-theme
    py-autopep8
    ))

(defvar latexPackages
  '(
    auctex ;; writing and formatting tex documents
    ))

;; concatenate all packages to a list
(setq allPackages (append generalPackages pythonPackages latexPackages))

;; install each package only if not installed already
(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      allPackages)
