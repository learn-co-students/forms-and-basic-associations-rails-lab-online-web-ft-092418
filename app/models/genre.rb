class Genre < ActiveRecord::Base
  # add associations
  has_many :songs
  has_many :artits, through: :songs
end
