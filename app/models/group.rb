class Group < ApplicationRecord
    belongs_to :user
    has_many :group_wallets
    has_many :wallets, through: :group_wallets

    validates :icon, presence: true
    validates :name, presence: true
end
