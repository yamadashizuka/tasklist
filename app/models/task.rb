class Task < ActiveRecord::Base
  belongs_to :status

  def dump
    puts "#################### dump Start!"
    self.attributes.each{ |key, val|
      puts key
      puts val
    }
    puts "#################### dump End!"
  end
end
