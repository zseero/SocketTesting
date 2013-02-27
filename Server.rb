require 'socket'

$clients = []

def output(client)
	while true
		line = client.gets.chomp
		puts line.chomp
	end
end

def input(client)
	while true
		line = gets.chomp
		client.puts(line)
	end
end

def connect(client)
	index = $clients.length
	$clients << client
	while s = client.gets
		s.chomp!
		puts(s)
		for i in 0...$clients.length
			$clients[i].puts(s) if i != index
		end
	end
	puts "User left"
	$clients.delete_at(index)
	client.close
end

printf 'Ip: '
hostname = gets.chomp
server = TCPServer.open(hostname, 2000)
puts 'Running'

def getUsers(server)
	while true
		client = server.accept
		puts 'User joined'
		t1 = Thread.new{connect(client)}
	end
end

t1 = Thread.new{getUsers(server)}
t1.join