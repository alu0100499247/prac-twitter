require 'twitter'
require './configure2'

nombre	= ARGV[0] || 'timoreilly'
#num 	= ARGV[1] 
usuario = Hash.new
lista = Twitter.friend_ids(nombre)

lista.ids.each do |fid|
	f = Twitter.user(fid)
	if (f.protected.to_s != "true")
		user[f.screen_name.to_s] = f.followers_count
	end
end

user.sort_by {|k,v| -v}.each {|user,count| puts "#{user}  ->  #{count}"}

