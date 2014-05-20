require 'spec_helper'

describe 'writing a new review' do
	before { Restaurant.create(name: 'Franco Manca', address: 'Brixton Village', cuisine: 'Pizza')}

	specify 'restaurants have no reviews when created' do
		visit '/restaurants'
		expect(page).to have_content '0 reviews'
	end

	it 'adds a review to the restaurant' do
		visit '/restaurants'
		click_link 'Review Franco Manca'

		fill_in 'Thoughts', with: 'This pizza wallows in mediocrity'
		select '2', from: 'Rating'
		click_button 'Leave Review'
		
		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'This pizza wallows in mediocrity'
		expect(page).to have_content '1 Review'
	end
end
