(add-to-list 'load-path "/cygdrive/c/cygwin/slime-2013-01-20/")

 
(setq auto-mode-alist
  (append '(
      ("\\.lisp$" . lisp-mode)
      ;; others to come
 
    )
    auto-mode-alist
  )
)
 
;==============
; LISP stuff
 
(setq inferior-lisp-program "/cygdrive/c/cygwin/bin/clisp.exe") ; this is where Cygwin puts the clisp program
 
(add-hook 'lisp-mode-hook
    (lambda ()
      (require 'slime)
      (slime-mode t)
      (slime-setup)
      (define-key lisp-mode-map [f9]   'slime)          ;; START LISP
      (define-key lisp-mode-map [f10]  'slime-eval-defun)
      (define-key lisp-mode-map [f11]  'slime-load-file)
      (define-key lisp-mode-map [f12]  'slime-complete-symbol)
      (define-key lisp-mode-map "["    'my-left-paren)
      (define-key lisp-mode-map "]"    'my-right-paren)
    )
)
 
;;;  Functions to re-bind brackets to parentheses and 
;;;  do parentheses matching for lisp mode
 
(defun my-right-paren ()
  "Insert the character \) and blink the matching parenthesis."
  (interactive)
  (insert-char 041 1)
  (let ((blink-matching-paren-distance
	  (buffer-size))
	(blink-matching-paren t))
    (blink-matching-open)
  )
)
 
(defun my-left-paren ()
  "Insert the character \( ."
  (interactive)
  (insert-char 040 1)
)
