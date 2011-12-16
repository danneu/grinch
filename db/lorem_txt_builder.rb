# Populates lorem.txt with random text

require "rest-client"
File.open('lorem.txt', 'w') do |f|
  counter = 1
  100.times do 
    text = RestClient.get 'http://loripsum.net/api/5/short'
    puts counter
    f.puts text
    f.puts 'end'
    counter += 1
  end
end
