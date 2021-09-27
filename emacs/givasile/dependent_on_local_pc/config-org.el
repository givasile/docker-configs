;; defines the directory where the agenda files are
(setq org-agenda-files (list "~/org/"))


;;store org-mode links to emails
(require 'org-mu4e)
;;store link to message if in header view, not to header query
(setq org-mu4e-link-query-in-headers-mode nil)

;; template for storing emails as todo tasks
(setq org-capture-templates
      '(("t" "todo" entry (file+headline "~/org/captures.org" "Tasks")
         "* TODO [#A] %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n%a\n")))


;; set the .org file, that all captured notes are saved to
(setq org-default-notes-file (concat org-directory "/captures.org"))


;; set org timer song
(setq org-clock-sound "~/.emacs.d/pomodoro.wav")

;; set-up org-publish
(require 'ox-publish)
(setq org-publish-project-alist
      '(
        ("org-notes"
         :base-directory "~/org/"
         :base-extension "org"
         :publishing-directory "~/org-published/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4; Just the default for this project.
         :auto-preamble t
         )

        ("org-static"
         :base-directory "~/org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/org-published/"
         :recursive t
         :publishing-function org-publish-attachment
         )

        ;; org has all components
        ("org" :components ("org-notes" "org-static"))
        ))



;; add calendar package
(require 'calfw)
(require 'calfw-org)
(defalias 'ca 'cfw:open-org-calendar)



;; ;; org-super-agenda configuration
;; (use-package org-super-agenda
;;   :ensure t
;;   :config
;;   (org-super-agenda-mode)
;;   )

;; (setq org-super-agenda-groups2
;;       '((:name "Next Items"
;;                :time-grid t
;;                :tag ("NEXT" "outbox"))
;;         (:name "Important"
;;                :priority "A")
;;         (:name "Quick Picks"
;;                :effort< "0:30")
;;         (:priority<= "B"
;;                      :scheduled future
;;                      :order 1)))

;; (defun my-super-agenda()
;;   "generates my super-agenda"
;;   (interactive)
;;   (org-super-agenda-mode)
;;   (let
;;       ((org-super-agenda-groups       '((:name "Next Items"
;;                                                :time-grid t
;;                                                :tag ("NEXT" "outbox"))
;;                                         (:name "Important"
;;                                                :priority "A")
;;                                         (:name "Quick Picks"
;;                                                :effort< "0:30")
;;                                         (:priority<= "B"
;;                                                      :scheduled future
;;                                                      :order 1))))
;;     (org-agenda nil "a")
;;     )
;;   )
