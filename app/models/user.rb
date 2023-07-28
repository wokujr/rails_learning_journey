# this model gonna have
# email:string
# password:string
#
# password:string virtual
# password_confirmation: string virtual

class User < ApplicationRecord
    has_secure_password

    #twitter
    has_many :twitter_accounts

    validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message:"must be a valid email address" }
end
