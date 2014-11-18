class Task < ActiveRecord::Base
  include Common
  belongs_to :status
  belongs_to :story
  after_commit :dump

end
