class Task < ActiveRecord::Base
  include Common
  belongs_to :status

end
