class Story < ActiveRecord::Base
  include Common
  has_many :tasks
  after_commit :dump
end
