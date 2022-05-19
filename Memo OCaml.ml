(* Mémo OCaml *)

(*    GENERAL    *)
(*Variables et fonctions*)
let a = 3;;
let f x = x + x;;

(*Calcul fortement typé*)
2 + 2;;
2.0 +. 1.0;;
2 + 1.0;; (*Erreur : type int != type float*)

(*= et ==*)
3 = 3;; (*true : même valeur*)
[|0;2;3|] == [|0;2;3|];; (*false : Deux objets, deux adresses*)

(*Pointeurs*)
let x = ref 23;;
!x;;

(*Fonctions de première classe*)
fun x-> x + x;;
let f = fun x -> x + 1;;
f(2);;

(*Fonctions d'ordre supérieur*)
let f x = x + 2;;
let g x = x * x;;
let composition f g x =f (g x);;
composition f g 3;;

(*Application partielle*)
let f x y = x*x + y*y ;;
let g = f 3;; (*g = f (x y) avec x fixé à 3*)
g(2);;



(*    ENREGISTREMENTS    *)
(*Déclaration d'un nouveau type*)
type complexe = {re : float; im : float};;
let z = {re = 1.0; im = -3.0};;

(*Modification d'un champ dans un rengistrement*)
z.re <- 0.5;; (*Impossible car le type n'est pas mutable*)

(*Déclaration et modification d'un type mutable*)
type personne = {nom : string ; mutable age : int};;
let martin = {nom = "Martin" ; age = 19};;
martin.age <- 20;;
martin.age;;

(*Enumérations*)
type figure =
|Valet |Dame |Roi |As;;

(*Utilisation des énumérations comme en C*)
let valeur_figure f =
match f with
|As ->11;
|Roi->4;
|Dame->3;
|Valet->2;;
let carte = Dame;;
valeur_figure carte;;



(*    ARRAYS    *)
(*Array => [||]*)
[|1;2;3|];;

(*Array.make n val = [|val;val;val ... n fois|]*)
Array.make 5 8;;

(*Array.make_matrix n p val = Matrice n lignes p colonnes de val *)
Array.make_matrix 3 5 0;;

(*Array.init n f = [|f(0);f(1);f(2) ... f(n)|]*)
let f x = x*x in
	Array.init 11 f;;

(*Accès à un élément d'un Array : tableau.(i)*)
let tab = [|1;2;3|];;
tab.(1);; (* =2 *)

(*Superposition des Arrays*)
let tab = [|1;2;3|];;
let tab2 = tab;;
tab2.(0) <- 0;;
tab;; (* [|0;2;3|]*)
(*Pour éviter les problèmes*)
let tab3 = Array.copy tab;;
tab3.(2) <- 5;;
tab;; (* [|0;2;3|] *)
tab3;; (* [|0;2;5|] *)



(*    CHARS ET STRINGS    *)
(*Caractères entre '', chaînes entre ""*)
'a';;
"bonjour";;

(* Concaténation *)
"bon" ^ "jour";;

(*ATTENTION : Char != String de longueur 1*)
(*On a les mêmes problèmes de superposition que les Arrays*)

(*Caractère <=> ASCII*)
int_of_char('a');;
char_of_int(97);;

(*Caractère dans une chaîne*)
let str = "bonjour";;
str.[0];; (*type char*)



(*    TUPLES    *)
(*Déclaration*)
1,2,3;;
(1,2,2,3);;



(*    LISTES CHAINEES    *)
(*Déclaration*)
1 :: 2 :: 3 :: [];;
[1;2;3];;
[1,2,3];; (*Un seul élément : tuple*)

(*Accès aux éléments*)
let liste = [1;2;3;4;5];;
List.hd liste;;
List.tl liste;;
List.nth liste 2;;

(*Ajout en tête de liste*)
let liste = [1;2;3;4;5];;
42 :: liste;;

(*Concaténer deux listes*)
let liste = [1;2;3;4;5];;
let liste2 = [10;11;12;13];;
liste @ liste2;;
List.append liste liste2;;

(*List.map f liste = [f(el) for el in liste]*)
let liste = [1;2;3;4;5];;
List.map (function x -> x*x) liste;;