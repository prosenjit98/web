class User < ApplicationRecord
    
    has_secure_password
    has_many :posts
    has_many :messege_contents

    has_one_attached :attachment

    EMAIL_REGEX= /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i



    

    scope :sorted, lambda { order("id ASC") }
    scope :newest_first, -> { order("created_at DESC") }
    scope :search, lambda { |qurey| where(["name LIKE ?","%#{qurey}%"]) }


    validates :email, :length => {:maximum => 50},
                  :presence => true,
                  :format => {:with => EMAIL_REGEX},
                  :confirmation => true
                  
    validates :username, :length =>{:within => 8..25},
                        :uniqueness => true,
                        :presence => true

    validates :first_name, :presence => true ,
                       :length => {:maximum => 25}
    validates :last_name, :presence => true ,
                      :length => {:maximum => 25}


end
