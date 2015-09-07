;;; -*- mode:text -*-

(in-readtable* arfe)

(defun emit (list)
  (if (stringp list)
      (write-line list)
      (progn
        (dolist (x list)
	  (princ x))
	(terpri))))

(defun pprint-to-string (x)
  (with-output-to-string (*standard-output*)
    (pprint x)))

(defun m$ (x) (format nil "$~A$" x))

(defun items (&rest args)
  (format nil "~{- ~A~%~}" args))

(defun latex-set (list)
  (format nil "\\{\\,~{~A~^,~}\\,\\}" list))

(defun latex-tuple (list)
  (format nil "(~{~A~^,~})" list))

(defun latex-rel (list)
  (format nil "\\{\\,~{~A~^,~}\\,\\}" (mapcar 'latex-tuple list)))

(defun latex-set-set (list)
  (latex-set (mapcar 'latex-set list)))

(defun latex-log (x)
  (with-output-to-string (*standard-output*)
    (clpl:print-latex x)))


(with-open-file (*standard-output* "text.md"
				   :direction :output
				   :if-exists :supersede)
  (emit
[

# test

$,(latex-set '(x_1 x_2)) $

$x$     | $f(x)$
--------|---------
$a$     | $x_1$ 
$b$     | $x_2$

Ein Graph
,(defparameter *g* (convert-graph-to-abc-if-needed (from-adj '(5 . 13109284))))
mit Knoten $,(latex-set (nodes *g*)) $
und Kanten $,(latex-rel (edges *g*)) $.

Semantik | Extensionen
---------|------------
GR       | $,(latex-set-set (list-extensions *g* #'grounded-extension-p)) $
CO       | $,(latex-set-set (list-extensions *g* #'complete-extension-p)) $
ST       | $,(latex-set-set (list-extensions *g* #'stable-extension-p)) $
PR       | $,(latex-set-set (list-extensions *g* #'preferred-extension-p)) $

# Eingabe AF

Gegeben sei ein AF

$$ F = (A,R) $$

mit

$$ A = \{a_1,a_2,\dots,a_n\} $$

einer Menge von $n$ Argumenten und

$$ R \subseteq A \times A $$

einer Angriffsrelation.

## Beispiel

### alt
Gegeben ist das AF

$$ F = (A,R) $$

mit

$$ A = \{a_1,a_2,a_3\} $$

und

$$ R = \{(a_1,a_2), (a_3,a_2), (a_1,a_1)\} .$$


### neu
Gegeben ist das AF

$$ F = (A,R) $$

mit

$$ A = ,(latex-set (nodes *g*)) $$

und

$$ R = ,(latex-rel (edges *g*)) .$$


# Problem

Es soll ein CSP fuer *EE-CO* erstellt werden. Dabei soll jede
Loesung des CSP einer Extension in $Cmpl(F)$ entsprechen.

# CSP

Unser CSP soll $2n$ Variablen haben, also doppet so viele Variablen,
wie das AF Argumente hat.

Das CSP $\mathscr{P}$ ist ein Tripel

$$ \mathscr{P} = (X,D,C) $$

mit $X = \{x_1,x_2,\dots,x_{2n}\} $ einer Menge von Variablen, 
$D = (D_{x_1},D_{x_2},\dots,D_{x_{2n}}) $ einem $2n$-Tupel endlicher Domaenen und
$C$ einer Menge von Constraints. 

Die Variablen sind alle boolsche Variablen, also gilt fuer die jeweiligen Domaenen
$$ D_{x_i} = \{true, false\} \quad\text{fuer alle}\quad 1\leq i \leq 2n .$$

# Variablen des CSP

Die Variablen

$$ X  = \{x_1,x_2,\dots,x_n,x'_1,x'_2,\dots,x'_n\} = X_{\phi} \cup X_{\phi'} $$ 

des CSP setzen sich aus zwei Mengen $$X_{\phi} = \{x_1,x_2,\dots,x_n\}
$$ und $$X_{\phi'} = \{x'_1,x'_2,\dots,x'_n\} $$ zusammen.

Wir definieren zwei Bijektionen $\phi \colon A \to X_{\phi}$ und $\phi'
\colon A \to X_{\phi'}$ mit

$$ \phi(a_i) = x_i \quad \text{fuer} \quad 1 \leq i \leq  n $$

und

$$ \phi'(a_i) = x'_i \quad \text{fuer} \quad 1 \leq i \leq  n,$$

die jeweils jedem Argument in $A$ eineindeutig eine Variable in
$X_{\phi}$ bzw. $X_{\phi'}$ zuordnen. Die Variablenmengen $X_{\phi}$
bzw. $X_{\phi'}$ sind dann durch das Bild der jewiligen Abbildung gegeben:

$$ X_{\phi}  = \phi(A) = \{ \phi(a) \,|\, a \in A \} $$ 
$$ X_{\phi'}  = \phi'(A) = \{ \phi'(a) \,|\, a \in A \} $$ 


## Beispiel

In unserem Beispiel gilt

$$ X_{\phi} = \{x_1,x_2,x_3\} $$
und
$$ X_{\phi'} = \{x_1',x_2',x_3'\}$$
und daher
$$ X = \{x_1,x_2,x_3,x_1',x_2',x_3'\}.$$

# Konfliktfreiheit

## Beispiel

$$,(defparameter *constraints* (mapcar (lambda (e) `(not (and ,@e))) (edges *g*)))$$

,(apply #'items (mapcar #'m$ (mapcar #'latex-log *constraints*)))

Der Wert von `*constraints*` ist:

~~~~~~~~~~~~~~~
,(pprint-to-string *constraints*)
~~~~~~~~~~~~~~~

]
))

(uiop:run-program "pandoc --mathjax -t html text.md -o text-mathjax.html")
(uiop:run-program "pandoc -s --mathjax -t html text.md -o text-s-mathjax.html")
(uiop:run-program "pandoc --mathml -t html text.md -o text-mathml.html")
(uiop:run-program "pandoc -s --mathml -t html text.md -o text-s-mathml.html")

(uiop:run-program "pandoc -t latex text.md -o text.tex")
(uiop:run-program "pandoc -s -t latex text.md -o text-s.tex")
#+nil(uiop:run-program "pandoc -s -t latex text.md -o text.pdf")
