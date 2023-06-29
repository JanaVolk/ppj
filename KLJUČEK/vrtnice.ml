let rec rose2tree = function 
  | Thorn a -> Leaf a
  | Rose [] -> Empty
  | Rose (h::t) ->Node (rose2tree h , rose2tree (Rose t))

let rec tree2rose = function 
    | Leaf a -> Thorn a
    | Empty -> Rose []
    | Node (a, b) -> let x = tree2rose a in let y = tree2rose b in 
      match x,y with  
      | Thorn glava1, Thorn ostanek ->Rose [Thorn glava1; Thorn ostanek ]
      | Rose glava,Thorn ostanek ->  Rose ( [x; Thorn ostanek])
      | Rose levdrev,Rose ostanek ->  Rose (x:: ostanek)
      | Thorn glava,Rose seznam -> Rose (Thorn glava :: seznam) 