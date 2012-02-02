class Project
  attr_accessor :name, :description, :links
  attr_reader :details
  @@instances = []

  def self.all
    @@instances
  end

  def initialize(name)
    @name = name
    @details = []
    @links = {}
    @@instances << self
  end

  def details=(details)
    @details = details.split("\n").map(&:strip)
  end
end

# Darkstrap
darkstrap = Project.new("Darkstrap")
darkstrap.description = "A dark theme for Twitter Bootstrap 2"
darkstrap.details = <<EOF
  Gives Twitter Bootstrap 2 a darker look 
  Cascades over the original Bootstrap CSS file, so just load it after Bootstrap
EOF
darkstrap.links = { github: "https://github.com/danneu/darkstrap", demo: "" }

# Grinch
grinch = Project.new("Grinch")
grinch.description = "Blog made with Rails"
grinch.details = <<EOF
  Powers this blog
  Caches posts to the public directory so requests don't hit Rails
  <a href="http://gettingreal.37signals.com/ch09_One_Interface.php">One Interface</a>: Admin uses the same interface as visitors
EOF
grinch.links = { github: "https://github.com/danneu/grinch", demo: "http://danneu.com"}

# Symposium
symposium = Project.new("Symposium")
symposium.description = "Forum system made with Rails"
symposium.details = <<EOF
  Recreates familiar forum functionality in Rails
  Ideally, I'd like to port my vBulletin community to my own Rails software
EOF
symposium.links = {github: "https://github.com/danneu/symposium", demo: "http://agathon.herokuapp.com"}

# vBulletin
community = Project.new("A Large Community")
community.description = "Busy vBulletin forum"
community.details = <<EOF
  5,000,000 posts, 28,000 members
  Founded in 2007
  My crack team of volunteer moderators manages most of it nowadays while I handle the technical side
  I'd like to one day run it on my own software
EOF
