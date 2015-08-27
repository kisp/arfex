(defparameter *g* (pl2af '(x (not y) (imp x y))))

(defparameter *args* (nth-value 1 (pl2af '(x (not y) (imp x y)))))

(with-open-file (out "af.dot" :direction :output :if-exists :supersede)
  (print-af-to-dot *g* out))

(uiop:run-program "dot -Tpdf af.dot >af.pdf")

(list-extensions *g* #'stable-extension-p)
