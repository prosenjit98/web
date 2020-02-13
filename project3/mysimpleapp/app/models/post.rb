class Post < ApplicationRecord
    has_many :messege_contents
    belongs_to :user
    has_one_attached :attachment

    scope :sorted, lambda { order("id ASC") }
    scope :newest_first, -> { order("created_at DESC") }
    scope :search, lambda { |qurey| where(["name LIKE ?","%#{qurey}%"]) }
    
end
