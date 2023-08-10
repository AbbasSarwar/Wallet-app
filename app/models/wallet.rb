class Wallet < ApplicationRecord
  belongs_to :user
  has_many :group_wallets, dependent: :destroy
  has_many :groups, through: :group_wallets

  validates :name, presence: true
  validates :amount, presence: true, numericality: true
end
