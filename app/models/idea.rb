class Idea < ApplicationRecord

    #==============CALLBACKS================>
    has_many :reviews, dependent: :destroy

    belongs_to :user
    #--------------------VALIDATIONS-------------------->

    validates :title, presence: { message: "must be provided"} , uniqueness: true, length: { minimum: 2, maximum: 200 }

  
    validates :body, presence: true









end
