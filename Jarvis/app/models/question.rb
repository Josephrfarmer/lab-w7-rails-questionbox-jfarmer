class Question < ApplicationRecord
  belongs_to :user 
  has_many :answers 
  paginates_per 10
end
