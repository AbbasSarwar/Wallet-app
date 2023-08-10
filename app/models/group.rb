class Group < ApplicationRecord
  belongs_to :user
  has_many :group_wallets, dependent: :destroy
  has_many :wallets, through: :group_wallets

  validates :name, presence: true
  validates :icon, presence: true

  has_one_attached :icon
end
