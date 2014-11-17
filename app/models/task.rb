class Task < ActiveRecord::Base
  include Common
  belongs_to :status
  after_commit :dump

end
