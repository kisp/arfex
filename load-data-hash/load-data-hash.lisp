(slow)

(ql:quickload "md5")

(deftype octet () '(unsigned-byte 8))

(defvar *available-symbols* (mapcar 'data-file2symbol (list-data-files)))

(defun calc-hash! (list)
  (let ((state (md5:make-md5-state)))
    (dolist (item (sort list #'< :key #'cdr))
      (let* ((string
               (with-output-to-string (output)
                 (print item output)))
             (vector (make-array (length string)
                                 :element-type 'octet
                                 :initial-contents (map 'list #'char-code string))))
        (md5:update-md5-state state vector)))
    (md5:finalize-md5-state state)))

(dolist (symbol *available-symbols*)
  (load-data symbol)
  (print symbol)
  (print (length (symbol-value symbol)))
  (print (calc-hash! (symbol-value symbol)))
  (unload-data symbol)
  (terpri))
