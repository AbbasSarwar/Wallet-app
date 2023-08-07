class User < ApplicationRecord
    has_many :groups 
    has_many :wallets

    validates :name, presence: true
end
