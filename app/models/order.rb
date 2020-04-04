class Order < ApplicationRecord
  belongs_to :client
  has_many :order_product
  has_many :products, :through => :order_product

  def add_product(product, quantity = 1)
    if quantity > 0
      self.order_product.create(product_id: product.id, quantity: quantity, total_product: (product.price*quantity) )
    end
  end
end
