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
