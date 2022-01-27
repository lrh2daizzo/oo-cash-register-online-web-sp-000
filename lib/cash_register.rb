require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction 

    def initialize(discount = 0)
        @discount = discount 
        @total = 0
        @items = []
    end

    def add_item(title, price, quantity = 1)
            
        @total += (price * quantity)
        quantity.times do 
            @items << title 
        end

        self.last_transaction = price * quantity 
    end

    def apply_discount
        if self.discount != 0 
            @total -= (@total * (discount.to_f / 100)).to_i 
            "After the discount, the total comes to $#{total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total = self.total - self.last_transaction
    end
end
