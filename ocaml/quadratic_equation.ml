(* ocaml quadratic_equation.ml  3. 5. 2. *)

(* http://progopedia.com/example/quadratic-equation/495/ *)
let square x = x *. x;;

let delta  a b c = ( square b-. (4. *. a *. c ));;

let   solve a b c   =
	if a=0. 
		then Printf.printf "Not a quadratic equation\n"
		else
			if   delta a b c  >= 0.
				then
					let   x1=( -.b +. sqrt(delta a b c )) /. (2. *. a)
						and x2=  (-.b -.  sqrt(delta a b c ))  /. (2. *. a)  
					in 
						Printf.printf "x1 =%.5f x2=%.5f \n"  x1  x2
				else 
					let   x= (-.b   /. (2. *. a))
						and i=     sqrt(4. *. a *. c -. square b)  /. (2. *. a) 
					in Printf.printf "x+ =%.5f+i%.5f  x-=%.5f-i%.5f \n"  x  i  x i
	;;



let () =
solve (float_of_string Sys.argv.(1))( float_of_string Sys.argv.(2) )(float_of_string Sys.argv.(3))







