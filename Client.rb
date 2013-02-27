require 'socket'

def output(server)
	while true
		line = server.gets.chomp
  	puts line.chomp
	end
end

def input(server, username)
	while true
		line = gets.chomp
		exit if line == 'quit'
		server.puts(username + line)
	end
end

printf 'Ip: '
hostname = gets.chomp
server = TCPSocket.open(hostname, 2000)
puts 'Connected'
printf 'Username: '
username = gets.chomp + ': '

t1 = Thread.new{input(server, username)}
t2 = Thread.new{output(server)}
t1.join
t2.join