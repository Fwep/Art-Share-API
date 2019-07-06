# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#

class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true

  has_many :artworks,
    foreign_key: :artist_id,
    dependent: :destroy

  has_many :artwork_shares,
    foreign_key: :viewer_id,
    dependent: :destroy

  has_many :shared_artworks,
    through: :artwork_shares,
    source: :artwork

  has_many :comments,
    foreign_key: :author_id,
    dependent: :destroy
end
