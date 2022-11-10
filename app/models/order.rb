class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment: { credit_card: 0, transfer: 1 }
  enum status: { making: 0, confirmed: 1, making: 2, preparation: 3, sent: 4 }
end
