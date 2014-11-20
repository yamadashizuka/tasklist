class Task < ActiveRecord::Base
  include Common
  belongs_to :statuscode
  belongs_to :story
  after_commit :dump

end
