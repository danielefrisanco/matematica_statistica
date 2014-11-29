#!/usr/bin/ruby

 
#ruby rot13.rb extreme
#if __FILE__ == $0
#
#	ARGV.each do |a|
#		a.split("").each do |x| 
#			if x.between?("A", "M") or x.between?("a","m")   
#				then  print((x[0].ord+13 ).chr)   
#				elsif x.between?("N","Z") or x.between?("n","z")  
#					then  print((x[0].ord-13 ).chr)
#
#			end
#		end
#
#		puts 
#	end
#end


if __FILE__ == $0
def fattoriale(n)
	if n==0 
		then   1 
		else   n*fattoriale(n-1)
	end
end
print fattoriale(11)
puts

end

