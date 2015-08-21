
(let (list)
  (loop
    (sb-ext:gc :full t)
    (room nil)
    (terpri)
    (loop repeat 2000000
          do (push 3 list)))
  (length list))
