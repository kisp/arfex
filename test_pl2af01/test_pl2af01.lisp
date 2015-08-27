(pl2af '(x (not y) (imp x y)))

(with-open-file (out "af.dot" :direction :output :if-exists :supersede)
  (print-af-to-dot (pl2af '(x (not y) (imp x y))) out))

(uiop:run-program "dot -Tpdf af.dot >af.pdf")
