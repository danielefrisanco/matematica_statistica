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

let   distanza_euclide p1 p2  =(sqrt((float((p1#get_x -p2#get_x))**2.) +.(float((p1#get_y -p2#get_y))**2.)));; 
let   distanza_manhattan p1 p2  =float(abs( p1#get_x -p2#get_x )+  abs(p1#get_y -p2#get_y));; 
let   stampa_distanza p1 p2  =
	Printf.printf   "dist %.5f   \n"  (distanza_euclide p1 p2 );;

let  rec distanza_minima p  lista dist distanza=
	match lista  with
		| []-> p#disegna
		|p1::coda -> let newdist=distanza  p p1 in
							if  newdist < dist then 
														begin 	p#set_color p1#get_color;
																distanza_minima p  coda  newdist distanza
														end
							else  distanza_minima p  coda  dist distanza;
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
let rec print_list2  lista =
List.iter (fun x -> x#stampa  ) lista 
;;
let rec print_disegna  lista =
	match lista  with
		| []->Printf.printf "fine\n"
		|p::coda -> p#disegna;  print_disegna coda
;;
let rec print_dist distanza  lista punto=
	match lista  with
		| []->Printf.printf "fine\n"
		|p::coda -> distanza p punto  ;print_dist distanza coda punto
;;
let sort_x p1 p2 =
 p1#get_x-p2#get_x;; 
let sort_y p1 p2 =
 p1#get_y-p2#get_y;; 
let   asd=make_list 150 in (*print_list2 asd ; *)
let puntix =List.fast_sort sort_x asd  and puntiy =List.fast_sort sort_y asd  in (*print_dist distanza_euclide asd (new point);print_disegna asd;*)
	for i = 0 to 359 do 
		for k = 0 to 239 do 
			let punto=new point in 
					punto#set_x i ;
					punto#set_y k ; (*punto#stampa; *)
					distanza_minima  punto puntix 10000. distanza_manhattan
		done
	done;;
read_line ();;
 






