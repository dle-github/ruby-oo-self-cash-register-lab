class CashRegister
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @itemList = []
        @transaction = []
        p "[initialize]"
        p "@discount: #{@discount}"
        p "@itemList: #{@itemList}"
        p "@total: $#{@total}"
        p self
    end
    attr_accessor :discount, :total


    def add_item(item, price, quantity = 1)
        @total += price * quantity
        @itemList.fill(item, @itemList.size, quantity)
        @transaction = [item, price, quantity]
        p "========================"
        p "[add_item]"
        p "@transaction: #{@transaction}"
        p "price: $#{price} x #{quantity}"
        p "@total: $#{@total}"
    end

    def apply_discount
        @total = @total - @total * @discount / 100
        p "========================"
        p "[apply_discount]"
        p "@discount: #{@discount}%"
        p "@total: $#{@total}"
        if @discount == 0
            p "There is no discount to apply."
        else
            p "After the discount, the total comes to $#{@total}."
        end
    end

    def items
        p "========================"
        p "[items]"
        p "@itemList #{@itemList}"
        return @itemList
    end

    def void_last_transaction
        @total = @total - @transaction[1]*@transaction[2]
    end
end

