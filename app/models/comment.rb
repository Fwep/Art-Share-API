# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  author_id  :integer          not null
#  artwork_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  body       :text
#

class Comment < ApplicationRecord
  validates :author_id, :artwork_id, :body, presence: true
  validates :body, length: {maximum: 255}

  belongs_to :author,
    class_name: 'User'

  belongs_to :artwork
end
