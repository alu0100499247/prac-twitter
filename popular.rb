require 'twitter'
require './configure2'

nombre	= ARGV[0] || 'timoreilly'
num 	= Integer(ARGV[1]) || 0 
usuario = Hash.new
lista = Twitter.friend_ids(nombre)

if num == 0
	lista.ids.each do |fid|
		f = Twitter.user(fid)
		if (f.protected.to_s != "true")
			usuario[f.screen_name.to_s] = f.followers_count
		end
	end
	#usuario.sort_by {|k,v| -v}.each {|user,count| puts "#{user}  ->  #{count}"}
else
	for i in (0..num)
		lista.ids.each do |fid|
			f = Twitter.user(fid)
			if (f.protected.to_s != "true")
				usuario[f.screen_name.to_s] = f.followers_count
			end		
		end
	end
	#usuario.sort_by {|k,v| -v}.each {|user,count| puts "#{user}  ->  #{count}"}
end

usuario.sort_by {|k,v| -v}.each {|user,count| puts "#{user}  ->  #{count}"}

