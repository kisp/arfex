(slow)

(load-data '*4-ir* '*4*)

(length (list-good-examples (generate-non-isomorphic 2 :irreflexive t)))
(length (list-good-examples (generate-non-isomorphic 2 :irreflexive nil)))


(length (list-good-examples (generate-non-isomorphic 3 :irreflexive t)))
(length (list-good-examples (generate-non-isomorphic 3 :irreflexive nil)))


(length (list-good-examples (generate-non-isomorphic 4 :irreflexive t)))
(length (list-good-examples (generate-non-isomorphic 4 :irreflexive nil)))

(length (list-good-examples *4-ir*))
(length (list-good-examples *4*))


;; (time (length (list-good-examples *5-ir*)))
;; (time (length (list-good-examples *5*)))


;; (time (length (list-good-examples *6-ir*)))
