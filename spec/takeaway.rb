class Takeaway


	def initialize()

		@menu = {'Pho'=>7, 'Cha ca'=>10, 'Banh xeo'=>8, 'Cao lau'=>12, 'Rau muong'=>4, 'Nem ran'=>9, 'Goi cuon'=>5}
		@payment = 0
	
	end

	def menu

		@menu

	end

	def order(dish_name, quantity)

		quantity.times {order_list << dish_name} if @menu.key?(dish_name)
		@payment = @payment + @menu[dish_name]*quantity

	end


	def order_list

		@order_list ||= []

	end

	def payment_due

		@payment

	end

	def checkout(customer_total)

		raise RuntimeError, "the total price is not correct" if customer_total != @payment
	
	end

end