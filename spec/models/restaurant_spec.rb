require 'spec_helper'

describe Restaurant do
	it 'must have a name' do
		expect(Restaurant.new(name: nil)).to have(2).errors_on(:name)
	end

	it 'must have a name' do
		expect(Restaurant.new(name: 'McDonalds')).to have(0).errors_on(:name)
	end

	it 'must have a cuisine' do
		expect(Restaurant.new(cuisine: nil)).to have(1).errors_on(:cuisine)
	end

	it 'must have a cuisine' do
		expect(Restaurant.new(cuisine: 'Burgers')).to have(0).errors_on(:cuisine)
	end

	it 'must have an address' do
		expect(Restaurant.new(address: nil)).to have(1).errors_on(:address)
	end

	it 'must have an address' do
		expect(Restaurant.new(address: 'London')).to have(0).errors_on(:address)
	end

	it 'is not valid unless the name starts with an uppercase letter' do
		expect(Restaurant.new(name: 'mcdonalds')).to have(1).errors_on(:name)
	end

end


describe '#average_rating' do
	let(:restaurant) { Restaurant.create(name: 'Franco Manca', address: 'Brixton Village', cuisine: 'Pizza')}

	it 'initially returns N/A' do
		expect(restaurant.average_rating).to eq 'N/A'
	end

	context '1 review' do
		before { restaurant.reviews.create(rating:3) }
		it 'returns the score of that review' do
			expect(restaurant.average_rating).to eq 3
		end
	end

	context 'more than 1 review' do
		before do
		  restaurant.reviews.create(rating:3)
			restaurant.reviews.create(rating:1)
		end

		it 'returns an average of the two ratings' do
			expect(restaurant.average_rating).to eq 2
		end
	end

	context 'a non-integer average' do
		before do
		  restaurant.reviews.create(rating:4)
			restaurant.reviews.create(rating:1)
		end

		it 'does not round up or down' do
			expect(restaurant.average_rating).to eq 2.5
		end
	end
end

