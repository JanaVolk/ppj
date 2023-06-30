type dvaTriDrevo = 
  | Empty
  | Two of dvaTriDrevo * int * dvaTriDrevo
  | Three of dvaTriDrevo * int * dvaTriDrevo * int * dvaTriDrevo
