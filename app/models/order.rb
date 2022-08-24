class Order < ApplicationRecord
    enum payment_method: { credit_card: 0, transfer: 1 }
    belongs_to :customer
    has_many :order_details
    
    enum status: { waiting: 0, payed: 1, progress: 2, standby: 3, complete: 4 }
end
