type korak = Dol | Gor | Levo | Desno;;
let korakec (x,y) korak = 
  match korak with
  | Dol -> (x, y - 1)
  | Gor -> (x, y + 1)
  | Levo -> (x - 1, y)
  | Desno -> (x + 1, y);;


let rec varna_pot mine (x,y) (z,w) koraki =
  if not (List.mem (x,y) mine) then
    match koraki with
    | [] -> true
    | h :: t -> varna_pot mine (korakec (x,y) h) (z,w) t
  else
    false;;
    
    