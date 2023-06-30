type 'a rose = Thorn of 'a | Rose of 'a rose list;;
type 'a tree = Empty | Leaf of 'a | Node of 'a tree * 'a tree;;

let rec rose2tree rose =
  match rose with
  | Thorn a -> Leaf a 
  | Rose list ->
    let rec to_list = function
    | [] -> Empty
    | h::t -> Node(rose2tree h, to_list(t))
  in to_list list
;;


let rec tree2rose tree = 
  match tree with
  | Empty -> raise (Failure "not a rose tree")
  | Leaf a -> Thorn a
  | Node(x, y) -> 
    let rec to_list = function
    | Empty -> []
    | Leaf x -> [Thorn x]
    | Node(x, y) -> [tree2rose x] @ to_list y
  in 
  Rose (to_list (Node(x,y)));;

(*
rose2tree (Rose [Thorn "a"; Thorn "b"; Thorn "c"]);;
rose2tree (Rose [Thorn 42; Rose [Thorn 23; Thorn 666; Rose []]; Rose []]);;

tree2rose (Node (Leaf "a", Node (Leaf "b", Node (Leaf "c", Empty))));;
tree2rose (Node (Node (Leaf 42, Empty), Empty));;
tree2rose (Node (Empty, Leaf 42));;
*)