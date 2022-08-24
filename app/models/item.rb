class Item < ApplicationRecord
    has_one_attached :image
    belongs_to :genre, dependent: :destroy
    has_many :cart_items
    has_many :order_details

end
