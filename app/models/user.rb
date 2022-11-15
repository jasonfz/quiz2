class User < ApplicationRecord
    has_secure_password

    #======Associations========>
    has_many :ideas, dependent: :destroy
    has_many :reviews, dependent: :destroy 
  
  
    #======Custom Method=======>
      def full_name
          self.first_name + " " + self.last_name
      end
  
     #=====Validation===========>
      VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
      validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX
  
  
  
end
