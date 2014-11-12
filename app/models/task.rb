class Task < ActiveRecord::Base
  belongs_to :status

  def dump
    puts "#################### dump Start!"
    puts Task.attribute_names
    puts "-------------"
    puts "-------------"
    Task.columns.each{|col|
      puts col.name
      puts self.column_for_attribute(col.name)
      }
    puts "#################### dump End!"
  end
end
