class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :order_id, :post_code, :prefecture_id, :city, :adresses, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "input correctly"}
    validates :city
    validates :adresses
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "input only number"}
    validates :token
  end
    validates :prefecture_id, numericality: {other_than: 1, message: "select"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id, city: city, adresses: adresses, phone_number: phone_number, building: building)
  end
end