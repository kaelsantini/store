class Order < ApplicationRecord
  belongs_to :client
  has_many :product
end
