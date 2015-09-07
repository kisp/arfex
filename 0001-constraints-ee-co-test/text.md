

# test

Ein Graph
*g*
mit Knoten $\{\,a,b,c,d,e\,\} $
und Kanten $\{\,(e,c),(d,e),(c,d),(b,a),(a,c),(a,b)\,\} $.

Semantik | Extensionen
---------|------------
GR       | $\{\,\{\,\,\}\,\} $
CO       | $\{\,\{\,\,\},\{\,b\,\},\{\,a,d\,\}\,\} $
ST       | $\{\,\{\,a,d\,\}\,\} $
PR       | $\{\,\{\,b\,\},\{\,a,d\,\}\,\} $

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

$$ A = \{\,a,b,c,d,e\,\} $$

und

$$ R = \{\,(e,c),(d,e),(c,d),(b,a),(a,c),(a,b)\,\} .$$


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


