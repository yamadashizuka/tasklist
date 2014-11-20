class Story < ActiveRecord::Base
  include Common
  has_many :tasks
end
