require 'takeaway'

describe Takeaway do

	let(:takeaway) {Takeaway.new}

	context 'menu' do

		it 'displays a menu with 8 items' do

			expect(takeaway.menu.length).to eq 8

		end

		it 'contains a dish named Pho priced 7' do

			expect(takeaway.menu.include?({dish: 'Pho', price: '7'})).to be_true

		end

	end

end