require 'twitter'
require './configure2'

nombre	= ARGV[0] || 'timoreilly'
num 	= Integer(ARGV[1]) || 0 
usuario = Hash.new
lista 	= Twitter.friend_ids(nombre)

lista.ids.each do |fid|
	f = Twitter.user(fid)
	if (f.protected.to_s != "true")
		usuario[f.screen_name.to_s] = f.followers_count
	end
end


for i in (0..(num-1)*2)
	if ((i % 2) == 0)
		puts "#{usuario.sort_by {|k,v| -v}.flatten[i]}  ->  #{usuario.sort_by {|k,v| -v}.flatten[i+1]}" 
	end
end
