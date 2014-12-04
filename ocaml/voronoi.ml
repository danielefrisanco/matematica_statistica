(* ocaml voronoi.ml   *)
  

 class point =
    object
      val mutable x =  Random.float 100.
      val mutable y =  Random.float 100.
      method get_x = x
      method get_y = y 
	  method stampa = Printf.printf "x%.5f y%.5f\n"  x y 
	  
    end;;

let   distanza p1 p2  =
	
	 
	Printf.printf   "dist %.5f   \n" (sqrt(((p1#get_x -.p2#get_x)**2.) +.((p1#get_y -.p2#get_y)**2.)))
	;;


let rec make_list  length =
match length with
|0->[]
|_ -> let p=new point in p::(make_list  (length-1))

;;

let rec print_list  lista =
match lista  with
| []->Printf.printf "fine\n"
|p::coda -> p#stampa  ;print_list coda

;;
let rec print_dist  lista punto=
match lista  with
| []->Printf.printf "fine\n"
|p::coda -> distanza p punto  ;print_dist coda punto

;;
let   asd=make_list 10 in print_list asd;print_dist asd (new point);;







