
(let (list)
  (loop
    (room nil)
    (loop repeat 5000000
          do (push 3 list)))
  (length list))
