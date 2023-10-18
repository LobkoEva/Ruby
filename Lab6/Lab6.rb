def is_ip_address(address)
  ipv4_pattern = /^(25[0-5]|2[0-4]\d|[01]?\d\d?)\.(25[0-5]|2[0-4]\d|[01]?\d\d?)\.(25[0-5]|2[0-4]\d|[01]?\d\d?)\.(25[0-5]|2[0-4]\d|[01]?\d\d?)$/

  return !!ipv4_pattern.match(address)
end

loop do
  print "Enter the IP address (or 0 to exit): "
  input = gets.chomp

  break if input == "0"

  if is_ip_address(input)
    puts "This is an IPv4 address"
  else
    puts "This is not an IPv4 address"
  end
end


