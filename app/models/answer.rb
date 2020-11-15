class Answer < ActiveRecord::Base
  belongs_to :proposition
  belongs_to :user
end
