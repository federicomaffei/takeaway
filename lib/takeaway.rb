require 'twilio-ruby'

class Takeaway

	attr_accessor :payment, :menu

	ACCOUNT_SID = 'AC97d26245bd7ae2ce002f206c85927024'
	AUTH_TOKEN = '5707512e34f45d0fb983ff97d4c1faf3'

	def initialize
		@menu = {'Pho'=>7, 'Cha ca'=>10, 'Banh xeo'=>8, 'Cao lau'=>12, 'Rau muong'=>4, 'Nem ran'=>9, 'Goi cuon'=>5}
		@payment = 0
		@client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
	end

	def order(dish_name, quantity)
		quantity.times {order_list << dish_name} if @menu.key?(dish_name)
		@payment = @payment + @menu[dish_name] * quantity
	end	

	def order_list
		@order_list ||= []
	end

	def checkout(customer_total)
		raise RuntimeError, "the total price is not correct" if customer_total != @payment
		send_text
	end

	def send_text
		time = Time.new + 3600
		message = @client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before #{time}.", :to => "+447721163161", :from => "+441280830048")
		puts message.sid
	end
end