(* ocaml distanza_fra_due_punti.ml  ~-.3.05 5.1 2.85 ~-.8.6*)
  


 

let   distanza x1 y1 x2 y2  =
	 
				(*	 sqrt(( (x1 -. x2 )** 2.)+. ((y1 -. y2)**2.))*)
	Printf.printf   "dist %.5f   \n" (sqrt(((x1 -.x2)**2.) +.((y1 -.y2)**2.)))
	;;

(*
let () =distanza ~-. 3.05 5.1 2.85 ~-. 8.6;;
*)
let () =
distanza (float_of_string Sys.argv.(1))( float_of_string Sys.argv.(2) )(float_of_string Sys.argv.(3))(float_of_string Sys.argv.(4))







