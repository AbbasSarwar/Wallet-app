class Entity < ApplicationRecord
  belongs_to :user
  has_many :groups, through: :group_wallets

  validates :name, presence: true
  validates :amount, presence: true ,numericality: {only_integer: true}
end
