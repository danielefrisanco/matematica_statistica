(* ocaml voronoi.ml   *)
#load "graphics.cma";;

open Graphics;;
Random.self_init ();;
Graphics.open_graph " 360x240";;
class point =
    object
		val mutable x =  Random.int 359
		val mutable y =  Random.int 239
		val mutable color =  rgb (Random.int 256)(Random.int 256)(Random.int 256)
		method get_x = x
		method get_y = y 
		method set_x newx= x<-newx
		method set_y newy  = y <-newy
		method set_color c = color <- c
		method get_color   = color  
		method stampa = Printf.printf "x%d y%d c%d\n"  x y color
		method disegna = set_color(color);     Graphics.plot  x y 
end;;

let   distanza p1 p2  =(sqrt((float((p1#get_x -p2#get_x))**2.) +.(float((p1#get_y -p2#get_y))**2.)));;
let   stampa_distanza p1 p2  =
	Printf.printf   "dist %.5f   \n"  (distanza p1 p2 );;

let  rec distanza_minima p  lista dist=
	match lista  with
		| []-> p#disegna
		|p1::coda -> let newdist=distanza p p1 in
							if  newdist < dist then 
														begin 	p#set_color p1#get_color;
																distanza_minima p  coda  newdist 
														end
							else  distanza_minima p  coda  dist;
;;

let rec make_list  length =
	match length with
		|0->[]
		|_ -> let p=new point in p::(make_list  (length-1))
;;

let rec print_list  lista =
	match lista  with
		| []->Printf.printf "fine\n"
		|p::coda -> p#stampa;  print_list coda
;;
let rec print_disegna  lista =
	match lista  with
		| []->Printf.printf "fine\n"
		|p::coda -> p#disegna;  print_disegna coda
;;
let rec print_dist  lista punto=
	match lista  with
		| []->Printf.printf "fine\n"
		|p::coda -> distanza p punto  ;print_dist coda punto
;;
let   asd=make_list 100 in (*print_list asd;print_dist asd (new point);print_disegna asd;*)
	for i = 0 to 359 do 
		for k = 0 to 239 do 
			let punto=new point in 
					punto#set_x i ;
					punto#set_y k ; (*punto#stampa; *)
					distanza_minima  punto asd 10000. 
		done
	done;;
read_line ();;
 






