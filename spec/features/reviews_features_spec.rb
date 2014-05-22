require 'spec_helper'

describe 'writing a new review' do
	before { Restaurant.create(name: 'Franco Manca', address: 'Brixton Village', cuisine: 'Pizza')}

	specify 'restaurants have no reviews when created' do
		visit '/restaurants'
		expect(page).to have_content '0 Reviews'
	end

	it 'adds a review to the restaurant' do
		leave_review(1, 'This pizza wallows in mediocrity')

		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'This pizza wallows in mediocrity'
		expect(page).to have_content '1 Review'
	end

	it 'calculates the average of reviews' do
		leave_review(3, 'not bad')
		leave_review(1, 'terrible')

		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'Average rating: 2'
	end


	def leave_review(rating, thoughts)
		visit '/restaurants'
		click_link 'Review Franco Manca'

		fill_in 'Thoughts', with: thoughts
		select rating.to_s, from: 'Rating'
		click_button 'Leave Review'
	end
end
