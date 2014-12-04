(* ocaml voronoi.ml   *)
 #load "graphics.cma";;

open Graphics;;
Random.self_init ();;
Graphics.open_graph " 640x480";;
 class point =
    object
      val mutable x =  Random.int 640
      val mutable y =  Random.int 480
      val mutable c =  rgb (Random.int 256)(Random.int 256)(Random.int 256)
      method get_x = x
      method get_y = y 
	  
	  method stampa = Printf.printf "x%d y%d\n"  x y 
	    method disegna = set_color(c);
     Graphics.plot  x y 
    end;;

let   distanza p1 p2  =
	
	 
	Printf.printf   "dist %.5f   \n" (sqrt((float((p1#get_x -p2#get_x))**2.) +.(float((p1#get_y -p2#get_y))**2.)))
	;;


let rec make_list  length =
match length with
|0->[]
|_ -> let p=new point in p::(make_list  (length-1))

;;

let rec print_list  lista =
match lista  with
| []->Printf.printf "fine\n"
|p::coda -> p#stampa;p#disegna; print_list coda

;;
let rec print_dist  lista punto=
match lista  with
| []->Printf.printf "fine\n"
|p::coda -> distanza p punto  ;print_dist coda punto

;;
let   asd=make_list 1000 in print_list asd;print_dist asd (new point);
 
read_line ()
;;
 






