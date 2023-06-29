lec rec listje = function
  | List -> 1
  | Plod p -> 0
  | Veja v -> listje v
  | Rogovila (a,b,t) -> listje a + listje b + listje t