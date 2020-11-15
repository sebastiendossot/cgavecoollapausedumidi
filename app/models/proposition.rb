class Proposition < ActiveRecord::Base
  belongs_to :team
  has_many :answers
end
