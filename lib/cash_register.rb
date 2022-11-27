require 'pry'

class CashRegister 
  attr_accessor :discount, :total, :item_arr

  def initialize(discount=0)
    @discount = discount
    @total = 0
    @item_arr = []
  end

  def total
    @total
  end

  def add_item(title, price, quantity=1)
    self.total += price * quantity
    self.item_arr << {title: title, price: price, quantity: quantity}
  end

  def apply_discount
    if discount > 0
      self.total = total - discount.to_f / 100 * total
      "After the discount, the total comes to $#{total.to_i}."
    else 
      "There is no discount to apply."
    end
  end

  def items
    new_arr = Array.new
    item_arr.map do |item|
      i = 0
      until i == item[:quantity] do
        new_arr << item[:title]
        i += 1
      end
    end
    new_arr
  end

  def void_last_transaction
    self.total -= item_arr.last[:price]
    self.item_arr.pop
    if item_arr.length == 0
      self.total = 0
    end
  end

end

iphone = CashRegister.new(20)
iphone.add_item('iPhone', 1000)
iphone.add_item('monitor', 700)
iphone.add_item('television', 500, 3)

binding.pry
