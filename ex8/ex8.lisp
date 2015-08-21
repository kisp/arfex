
(let (list)
  (loop
    (room nil)
    (terpri)
    (loop repeat 1000000
          do (push 3 list)))
  (length list))
