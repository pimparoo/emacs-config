;;; myfunctions.el --- vanilla emacs config
;;; Commentary:
;;; some homemade functions
;;; and some proudly copy-pasted functions
;;; code:

(require 'repeat)
(defun rep (cmd)						; if cmd is not a compiled function, it must be already loaded with (require 'source-file)
    "Returns a new command that is a repeatable version of CMD.
The new command is named CMD-repeat.  CMD should be a quoted
command.

This allows you to bind the command to a compound keystroke and
repeat it with just the final key.  For example:

  (global-set-key (kbd \"C-c a\") (rep 'foo))

will create a new command called foo-repeat.  Typing C-c a will
just invoke foo.  Typing C-c a a a will invoke foo three times,
and so on."
	(fset (intern (concat (symbol-name cmd) "-repeat"))
		  `(lambda ,(help-function-arglist cmd) ;; arg list
			 ,(format "A repeatable version of `%s'." (symbol-name cmd)) ;; doc string
			 ,(interactive-form cmd) ;; interactive form
			 ;; see also repeat-message-function
			 (setq last-repeatable-command ',cmd)
			 (repeat nil)))
	(intern (concat (symbol-name cmd) "-repeat")))

(defun xpaste ()
  "paste from x clipboard"
  (interactive)
  (insert (shell-command-to-string "cat /dev/clipboard"))
)

(defun reload-dotemacs-file ()
  "Reload .emacs."
  (interactive)
  (load-file "~/.emacs"))

(defun smart-beginning ()
  "Obvious."
  (interactive)
  (if (region-active-p) (region-beginning) (line-beginning-position)))

(defun smart-end ()
  "Same."
  (interactive)
  (if (region-active-p) (region-end) (line-end-position)))

(defun region-execute-python ()
  "Replace region by python output."
  (interactive)
  (let ((s (replace-regexp-in-string "\"" "'" (buffer-substring (smart-beginning) (smart-end)))))
	(progn
	  (kill-region (smart-beginning) (smart-end))
	  (insert (shell-command-to-string (concat "python2.7 -c \"" s "\"")))
	  )))
																								   
(defun region-as-python-string ()
  "Replace region by python-string."
  (interactive)
  (let ((s (replace-regexp-in-string "\"" "'" (buffer-substring (smart-beginning) (smart-end)))))
	(progn
	  (kill-region (smart-beginning) (smart-end))
	  (insert (shell-command-to-string (concat "python2.7 -c \"import sys; sys.stdout.write(" s "); sys.stdout.flush()\"")))
	  )))

(defun search-google ()
  "Googles a query or region if any."
  (interactive)
  (browse-url
   (concat
	"http://www.google.com/search?ie=utf-8&oe=utf-8&q="
	(if mark-active
		(buffer-substring (smart-beginning) (smart-end))
	  (read-string "Google: ")))))

(defun duplicate-line-or-region (&optional n)
  "Duplicate current line, or region if active.
With argument N, make N copies.
With negative N, comment out original line and use the absolute value."
  (interactive "*p")
  (let ((use-region (use-region-p)))
	(save-excursion
	  (let ((text (if use-region        ;Get region if active, otherwise line
					  (buffer-substring (region-beginning) (region-end))
					(prog1 (thing-at-point 'line)
					  (end-of-line)
					  (if (< 0 (forward-line 1)) ;Go to beginning of next line, or make a new one
						  (newline))))))
		(dotimes (i (abs (or n 1)))     ;Insert N times, or once if not specified
		  (insert text))))
	(if use-region nil                  ;Only if we're working with a line (not a region)
	  (let ((pos (- (point) (line-beginning-position)))) ;Save column
		(if (> 0 n)                             ;Comment out original with negative arg
			(comment-region (line-beginning-position) (line-end-position)))
		(forward-line 1)
		(forward-char pos)))))

(defun copy-line (arg)
	  "Copy lines (as many as prefix argument) in the kill ring.
	  Ease of use features:
	  - Move to start of next line.
	  - Appends the copy on sequential calls.
	  - Use newline as last char even on the last line of the buffer.
	  - If region is active, copy its lines."
	  (interactive "p")
	  (let ((beg (line-beginning-position))
			(end (line-end-position arg)))
		(when mark-active
		  (if (> (point) (mark))
			  (setq beg (save-excursion (goto-char (mark)) (line-beginning-position)))
			(setq end (save-excursion (goto-char (mark)) (line-end-position)))))
		(if (eq last-command 'copy-line)
			(kill-append (buffer-substring beg end) (< end beg))
		  (kill-ring-save beg end)))
	  (kill-append "\n" nil)
	  (beginning-of-line (or (and arg (1+ arg)) 2))
	  (if (and arg (not (= 1 arg))) (message "%d lines copied" arg)))

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
	(if (region-active-p)
		(setq beg (region-beginning) end (region-end))
	  (setq beg (line-beginning-position) end (line-end-position)))
	(comment-or-uncomment-region beg end)
	(next-line)))

(provide 'myfunctions)
;;; myfunctions.el ends here
