class MessegeContent < ApplicationRecord
    belongs_to :post
    belongs_to :user

    scope :sorted, lambda { order("id ASC") }
    scope :newest_first, -> { order("created_at DESC") }
    scope :search, lambda { |qurey| where(["name LIKE ?","%#{qurey}%"]) }
end
