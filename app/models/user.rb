class User < ActiveRecord::Base
  validates :name, :age, presence: true
  validates :age, uniqueness: false
end