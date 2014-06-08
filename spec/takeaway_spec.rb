require 'takeaway'

describe Takeaway do

	let(:takeaway) {Takeaway.new}

	context 'menu' do

		it 'displays a menu with 7 items' do

			expect(takeaway.menu.length).to eq 7

		end

		it 'contains a dish named Pho priced' do

			expect(takeaway.menu.include?('Pho')).to be_true

		end

	end

	context 'order' do

		it 'allows to add dishes to the order list by name and quantity' do

			takeaway.order('Pho', 2)
			expect(takeaway.order_list).to eq ['Pho', 'Pho']

		end

		it 'updates the bill at any order placed' do

			takeaway.order('Pho', 2)
			takeaway.order('Cha ca', 1)
			expect(takeaway.payment_due).to eq 24
		end

	end

	context 'checkout' do

		it 'check the total given by the customer before finalizing the order' do

			takeaway.order('Pho', 2)
			takeaway.order('Cha ca', 1)
			lambda {takeaway.checkout(20)}.should raise_error(RuntimeError)

		end
	end
end