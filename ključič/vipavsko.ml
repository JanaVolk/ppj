(*
a) (10 točk) Vipavsko zaporedje 0, 1, −2, 5, −12, 29, −70, 169, . . . je definirano z rekurzivnim
predpisom
x0 = 0, x1 = 1, xn = xn−2 − 2 · xn−1 za n ≥ 2.
Sestavite funkcijo vipavsko : int -> int, ki izračuna n-ti člen Vipavskega zaporedja. Primer
uporabe:
# List . map vipavsko [0; 1; 2; 3; 4; 5; 6; 7] ;;
- : int list = [0; 1; -2; 5; -12; 29; -70; 169]
Za vse točke mora funkcija n-ti člen izračunati v času O(n), na primer vipavsko 31 takoj vrne
odgovor 259717522849. Opomba: to podnalogo lahko rešite kot poseben primer podnaloge (c).
*)

let vipavsko stevilo =
  let rec aux predprejsnje prejsnje goal n  =   
      match goal with 
      | 0 -> 0
      | 1 -> 1 
      | g-> if n = goal then  (predprejsnje- 2*prejsnje)
            else  let naslednje = (predprejsnje - 2 * prejsnje) in 
            aux prejsnje naslednje goal (n+1)
in aux 0 1  stevilo 2

(*
Sedaj posplošimo pojem Vipavskega zaporedja. Primorsko zaporedje x0, x1, x2, . . . je določeno
s številoma a, b ∈ Z in preslikavo f : Z → Z → Z ter definirano takole:
x0 = a, x1 = b, xn = f xn−2 xn−1 za n ≥ 2.
Primer: Vipavsko zaporedje dobimo pri a = 0, b = 1 in f m n = m − 2 · n.
b) (5 točk) Zapišite a, b in f, da bo veljalo xn = 2n
:

*)
 
let zaporedje a b funkcija stevilo =
    let rec aux predprejsnje prejsnje goal n  =   
        match goal with 
        | 0 -> a
        | 1 -> b
        | g-> if n = goal then funkcija predprejsnje prejsnje
              else  let naslednje = funkcija predprejsnje prejsnje in 
              aux prejsnje naslednje goal (n+1)
  in aux 0 1  stevilo 2
