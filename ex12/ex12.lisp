(with-output-to-file (output "g.dot" :if-exists :supersede)
  (write-line "digraph g
        {

rankdir=LR;

XXX[style=\"filled\",fillcolor=\"white\"];

A[style=\"filled\",fillcolor=\"white\"];
B[style=\"filled\",fillcolor=\"white\"];
C[style=\"filled\",fillcolor=\"white\"];
D[style=\"filled\",fillcolor=\"white\"];
E[style=\"filled\",fillcolor=\"white\"];
A -> A;
A -> B;
B -> D;
D -> C;
C -> B;
E -> D;
D -> E;
}
"
              output))

(uiop:run-program "dot -Tpdf g.dot >g.pdf")
