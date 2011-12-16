require 'rails'

class TempPost
  attr_accessor :title, :body
  def initialize(args)
    @title, @body = args[:title], args[:body]
  end
end

class String
  def remove_html
    self.gsub('<p>','').gsub('</p>','')
  end
  def remove_newlines
    self.gsub("\n",'').gsub("\r",'')
  end
end

File.open('lorem.txt', 'r') do |lorem|
  File.open('seeds.rb', 'w') do |seeds|
    seeds.puts "Post.destroy_all\n"
    while line = lorem.gets
      body ||= ''
      if line.strip == 'end'
        title = body.remove_html.split[-3..-1].join(' ')[0..-2]
        body = body.remove_newlines
        new_body = ''
        body.each_char do |char|
          if [' ', '<', '>', '/'].include? char
            new_body << char
          else
            new_body << char.parameterize 
          end
        end
        body = new_body
        post = TempPost.new(title: title, body: body)
        seeds.puts "Post.create(title: '#{title}', body: '#{body}')\n"
        body = ''
      else
        body += line
      end
    end
  end
end


