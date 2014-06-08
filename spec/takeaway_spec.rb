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

	end

end